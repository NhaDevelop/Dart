import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

// Stateless widget to display a list of expenses
class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onExpenseRemoved,
    required this.onExpenseRestore,
  });

  // List of expenses to be displayed
  final List<Expense> expenses;
  
  // Callback function to handle expense removal
  final Function(Expense) onExpenseRemoved;
  
  // Callback function to handle expense restoration
  final Function(int, Expense) onExpenseRestore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Adds padding around the list
      child: expenses.isNotEmpty
          ? ListView.builder(
              itemCount: expenses.length, // Number of items in the list
              itemBuilder: (context, index) => Dismissible(
                key: ValueKey(expenses[index].id), // Unique key for each item
                background: Container(
                  decoration: BoxDecoration(
                    color: Colors.red, // Background color when swiping to delete
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  alignment: Alignment.centerRight, // Aligns icon to the right
                  padding: const EdgeInsets.symmetric(horizontal: 20), // Padding inside the container
                  child: const Icon(Icons.delete, color: Colors.white), // Delete icon
                ),
                onDismissed: (direction) {
                  final removedExpense = expenses[index]; // Expense to be removed
                  final removedIndex = index; // Index of the removed expense

                  onExpenseRemoved(removedExpense); // Calls the callback to remove the expense

                  // Shows a snackbar with undo option
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 3), // Duration of the snackbar
                      content: Text('${removedExpense.title} deleted'), // Message in the snackbar
                      action: SnackBarAction(
                        label: 'Undo', // Undo button label
                        onPressed: () {
                          onExpenseRestore(removedIndex, removedExpense); // Calls the callback to restore the expense
                        },
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4, // Elevation for the card shadow effect
                  margin: const EdgeInsets.symmetric(vertical: 8), // Margin between cards
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: ExpenseItem(expenses[index]), // Displays the expense item
                ),
              ),
            )
          : Container(
              alignment: Alignment.center, // Centers the content
              child: Column(
                mainAxisSize: MainAxisSize.min, // Column takes minimum space
                children: [
                  Icon(Icons.money_off, size: 80, color: Colors.grey[400]), // Icon for empty state
                  const SizedBox(height: 16), // Space between icon and text
                  Text(
                    'No expenses found. Start adding some!', // Message for empty state
                    style: TextStyle(
                      fontSize: 18, // Font size for the text
                      color: Colors.grey[600], // Text color
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
