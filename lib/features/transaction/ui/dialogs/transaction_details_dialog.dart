import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionDetailsDialog extends StatefulWidget {
  const TransactionDetailsDialog({super.key});

  @override
  State<TransactionDetailsDialog> createState() => _TransactionDetailsDialogState();
}

class _TransactionDetailsDialogState extends State<TransactionDetailsDialog> {
  // Примерные контроллеры и переменные
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
        preferredSize: const Size.fromHeight(kToolbarHeight + 50),
        child: Container(
          color: theme.appBarTheme.backgroundColor ?? theme.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Expanded(
                      child: Text(
                        "OUTCOME DETAILS",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
            // Счет
            ListTile(
              onTap: _selectAccount,
              title: Text('Счет', style: theme.textTheme.bodyMedium),
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
            const Divider(height: 1),
            // Категория
            ListTile(
              onTap: _selectCategory,
              title: Text('Статья', style: theme.textTheme.bodyMedium),
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
            const Divider(height: 1),
            // Сумма
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                controller: amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Сумма',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // Дата
            ListTile(
              onTap: _selectDate,
              title: Text('Дата', style: theme.textTheme.bodyMedium),
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
            const Divider(height: 1),
            // Время
            ListTile(
              onTap: _selectTime,
              title: Text('Время', style: theme.textTheme.bodyMedium),
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
            const Divider(height: 1),
            // Комментарий
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                controller: commentController,
                decoration: const InputDecoration(
                  hintText: 'Комментарий',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
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
