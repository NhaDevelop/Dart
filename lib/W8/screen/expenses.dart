import 'package:flutter/material.dart';

import '../Model/expense.dart';
import '../screen/expenseslist.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "book",
        type: ExpenseType.leisure,
        amount: 12,
        date: DateTime.now()),
    Expense(
        title: "milk",
        type: ExpenseType.food,
        amount: 1.5,
        date: DateTime.now()),
    Expense(
        title: "lock lack",
        type: ExpenseType.food,
        amount: 2,
        date: DateTime.now()),
  ];
   void onAddClicked(){
    print("1233");
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [IconButton(onPressed: onAddClicked  , icon: const Icon(Icons.add))],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: ExpensesList(expenses: _registeredExpenses),
    );
  }
}
