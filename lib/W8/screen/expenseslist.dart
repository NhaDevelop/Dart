import 'package:flutter/material.dart';
import  '../Model/expense.dart';


class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       ...expenses.map((e) => Text(e.title)),
//     ]);
//   }
// }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Text(index.toString()),
    );
  }
}