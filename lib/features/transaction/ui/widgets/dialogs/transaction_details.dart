import 'package:fin_tamer/features/transaction/domain/models/transaction.dart';
import 'package:fin_tamer/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionDetails extends StatefulWidget {
  const TransactionDetails({super.key});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();

  static Future<void> showDetailsModal(BuildContext context, {Transaction? transaction}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const TransactionDetails(),
    );
  }
}

class _TransactionDetailsState extends State<TransactionDetails> {
  String selectedAccount = 'Сбербанк';
  String selectedCategory = 'Продукты';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    commentController.dispose();
    super.dispose();
  }

  void _selectAccount() {
    // TODO: реализовать выбор счета
  }

  void _selectCategory() {
    // TODO: реализовать выбор категории
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _deleteTransaction() {
    // TODO: реализовать удаление
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      "Мои расходы",
                      style: theme.textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () {
                        // TODO: обработка сохранения
                        Navigator.of(context).pop();
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
              title: Text('Счет', style: theme.textTheme.bodyLarge),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    selectedAccount,
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
              title: Text('Статья', style: theme.textTheme.bodyLarge),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    selectedCategory,
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
            TextField(
              controller: amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              style: theme.textTheme.bodyLarge,
              decoration: const InputDecoration(
                hintText: 'Сумма',
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            const Divider(),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
              onTap: _selectDate,
              title: Text('Дата', style: theme.textTheme.bodyLarge),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    DateFormat('dd.MM.yyyy').format(selectedDate),
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
              title: Text('Время', style: theme.textTheme.bodyLarge),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    selectedTime.format(context),
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
            TextField(
              controller: commentController,
              decoration: const InputDecoration(
                hintText: "Комментарий",
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            const Divider(height: 1),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.alarmLight,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: _deleteTransaction,
                child: const Text('Удалить расход'),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
