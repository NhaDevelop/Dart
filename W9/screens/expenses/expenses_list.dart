import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onExpenseRemoved,
    required this.onExpenseRestore,
  });

  final List<Expense> expenses;
  final Function(Expense) onExpenseRemoved;
  final Function(int, Expense) onExpenseRestore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: expenses.isNotEmpty
          ? ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) => Dismissible(
                key: ValueKey(expenses[index].id),
                background: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  final removedExpense = expenses[index];
                  final removedIndex = index;

                  onExpenseRemoved(removedExpense);

                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 3),
                      content: Text('${removedExpense.title} deleted'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          onExpenseRestore(removedIndex, removedExpense);
                        },
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ExpenseItem(expenses[index]),
                ),
              ),
            )
          : Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.money_off, size: 80, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'No expenses found. Start adding some!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
