import 'package:flutter/material.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key, required this.addTodo});

  final Function() addTodo;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.lightGreen,
      onPressed: () {
        addTodo();
      },
      shape: CircleBorder(),
      child: Icon(Icons.add),
    );
  }
}

