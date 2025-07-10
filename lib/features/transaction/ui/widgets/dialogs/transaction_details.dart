import 'package:fin_tamer/core/di/repository_providers.dart';
import 'package:fin_tamer/core/extensions/date_time_extension.dart';
import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/account/domain/models/account_brief.dart';
import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:fin_tamer/features/category/domain/models/category.dart';
import 'package:fin_tamer/features/category/domain/services/categories_service.dart';
import 'package:fin_tamer/features/category/ui/widgets/category_item.dart';
import 'package:fin_tamer/features/history/domain/services/transaction_chart_service.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_create_data.dart';
import 'package:fin_tamer/features/transaction/domain/models/transaction_update_data.dart';
import 'package:fin_tamer/features/transaction/domain/services/history/history_filtered_transaction_service.dart';
import 'package:fin_tamer/features/transaction/domain/services/today_transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TransactionDetails extends ConsumerStatefulWidget {
  const TransactionDetails({super.key, required this.isIncome, this.transaction});

  final Transaction? transaction;
  final bool isIncome;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TransactionDetailsState();

  static Future<void> showDetailsModal(BuildContext context, {required bool isIncome, Transaction? transaction}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => TransactionDetails(
        isIncome: isIncome,
        transaction: transaction,
      ),
    );
  }
}

class _TransactionDetailsState extends ConsumerState<TransactionDetails> {
  AccountBrief? _selectedAccount;
  Category? _selectedCategory;
  late final bool _isCreateMode;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.transaction != null) {
      _isCreateMode = false;
      _selectedAccount = widget.transaction!.account;
      _selectedCategory = widget.transaction!.category;
      _selectedDate = widget.transaction!.transactionDate;
      _selectedTime = TimeOfDay.fromDateTime(widget.transaction!.transactionDate);
      _amountController.text = widget.transaction!.amount.toString();
      _commentController.text = widget.transaction!.comment ?? "";
    } else {
      _isCreateMode = true;
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _selectAccount() async {
    final selected = await showModalBottomSheet<Account>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => Consumer(
        builder: (context, ref, child) {
          final theme = Theme.of(context);

          return ref
              .watch(
                accountServiceProvider,
              )
              .when(
                data: (account) {
                  return ListTile(
                    onTap: () => GoRouter.of(context).pop(account),
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
                    title: Text(
                      account!.name,
                      style: theme.textTheme.bodyLarge,
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return Text(AppLocalizations.of(context)!.error);
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
        },
      ),
    );

    if (selected == null) return;

    setState(() {
      _selectedAccount = selected.toBrief();
    });
  }

  void _selectCategory() async {
    final selected = await showModalBottomSheet<Category>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => Consumer(
        builder: (context, ref, child) {
          return ref
              .watch(
                categoriesServiceProvider,
              )
              .when(
                data: (categories) {
                  final filteredCategories = categories.where((c) => c.isIncome == widget.isIncome).toList();

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredCategories.length,
                    itemBuilder: (context, index) {
                      final category = filteredCategories[index];

                      return GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pop(category);
                        },
                        child: CategoryItem(
                          item: category,
                        ),
                      );
                    },
                  );
                },
                error: (error, stackTrace) {
                  return Text(AppLocalizations.of(context)!.error);
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
        },
      ),
    );

    if (selected == null) return;

    setState(() {
      _selectedCategory = selected;
    });
  }

  bool isValid() {
    return _selectedAccount != null && _selectedCategory != null && _amountController.text.trim().isNotEmpty;
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      ),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _deleteTransaction() async {
    try {
      final transactionService = await ref.read(transactionRepositoryProvider.future);
      await transactionService.delete(widget.transaction!.id);
      ref.invalidate(todayTransactionServiceProvider(isIncome: widget.isIncome));
      ref.invalidate(historyFilteredTransactionServiceProvider(isIncome: widget.isIncome));
      ref.invalidate(transactionChartServiceProvider);
      ref.invalidate(accountServiceProvider);
      GoRouter.of(context).pop();
    } catch (e) {
      await _showErrorDialog(e.toString());
    }
  }

  Future<void> _onSave() async {
    final combinedDate = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );
    if (!isValid()) {
      await _showValidationDialog();
      return;
    }
    try {
      final transactionService = await ref.read(transactionRepositoryProvider.future);
      if (_isCreateMode) {
        final request = TransactionCreateData(
          accountId: _selectedAccount!.id,
          categoryId: _selectedCategory!.id,
          amount: NumberFormat().parse(_amountController.text.trim()) as double,
          transactionDate: combinedDate,
          comment: _commentController.text.trim().isEmpty ? null : _commentController.text.trim(),
        );
        await transactionService.create(request);
      } else {
        final request = TransactionUpdateData(
          id: widget.transaction!.id,
          accountId: _selectedAccount!.id,
          categoryId: _selectedCategory!.id,
          amount: NumberFormat().parse(_amountController.text.trim()) as double,
          transactionDate: combinedDate,
          comment: _commentController.text.trim().isEmpty ? null : _commentController.text.trim(),
        );
        await transactionService.update(request);
      }
      ref.invalidate(todayTransactionServiceProvider(isIncome: widget.isIncome));
      ref.invalidate(historyFilteredTransactionServiceProvider(isIncome: widget.isIncome));
      ref.invalidate(transactionChartServiceProvider);
      ref.invalidate(accountServiceProvider);
      GoRouter.of(context).pop();
    } catch (e) {
      await _showErrorDialog(e.toString());
    }
  }

  Future<void> _showValidationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final loc = AppLocalizations.of(context)!;
        return AlertDialog(
          title: Text(
            loc.validationErrorTitle,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          content: Text(
            loc.validationErrorContent,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(loc.okButton),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showErrorDialog(String message) async {
    final loc = AppLocalizations.of(context)!;
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(loc.error, style: Theme.of(context).textTheme.bodyLarge),
          content: Text(message, style: Theme.of(context).textTheme.bodyLarge),
          actions: <Widget>[
            TextButton(
              child: Text(loc.okButton),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();
    final separator = NumberFormat.decimalPattern(locale).symbols.DECIMAL_SEP;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 56),
        child: Container(
          color: theme.appBarTheme.backgroundColor ?? theme.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => GoRouter.of(context).pop(),
                    ),
                    Text(
                      widget.isIncome ? loc.incomeTitle : loc.outcomeTitle,
                      style: theme.textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () async {
                        await _onSave();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
              onTap: _selectAccount,
              title: Text(loc.accountFieldTitle, style: theme.textTheme.bodyLarge),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _selectedAccount != null ? _selectedAccount!.name : "",
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.chevron_right,
                    color: Color(0x4d3c3c43),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
              onTap: _selectCategory,
              title: Text(loc.categoryFieldTitle, style: theme.textTheme.bodyLarge),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _selectedCategory != null ? _selectedCategory!.name : "",
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.chevron_right,
                    color: Color(0x4d3c3c43),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
              title: Text(loc.amountDayTitle),
              trailing: SizedBox(
                width: 120,
                child: TextField(
                  controller: _amountController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[\d.,]')),
                  ],
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const Divider(),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
              onTap: _selectDate,
              title: Text(loc.dateFieldTitle, style: theme.textTheme.bodyLarge),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _selectedDate.toddMMyyyy(),
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.chevron_right,
                    color: Color(0x4d3c3c43),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
              onTap: _selectTime,
              title: Text(loc.timeFieldTitle, style: theme.textTheme.bodyLarge),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _selectedTime.format(context),
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.chevron_right,
                    color: Color(0x4d3c3c43),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: loc.commentHint,
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const Divider(height: 1),
            const SizedBox(height: 16),
            _isCreateMode
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: _deleteTransaction,
                      child: Text(widget.isIncome ? loc.deleteIncome : loc.deleteOutcome),
                    ),
                  ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
