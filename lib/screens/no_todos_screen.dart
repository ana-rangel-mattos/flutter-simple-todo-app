import 'package:flutter/material.dart';
import 'package:simple_todo_app/components/todos_text.dart';

class NoTodosScreen extends StatelessWidget {
  const NoTodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TodosText("Add a new to do to start");
  }
}
