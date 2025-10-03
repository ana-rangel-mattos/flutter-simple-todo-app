import 'package:flutter/material.dart';
import 'package:simple_todo_app/components/todos_text.dart';
import 'package:simple_todo_app/models/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(this.index, {super.key, required this.todo, required this.onChangedChecked});

  final int index;
  final Todo todo;
  final Function(bool) onChangedChecked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: ListTile(
        tileColor: index.isEven ? Colors.lightGreen[200] : Colors
            .grey[200],
        title: TodosText(todo.title),
        subtitle: Text("Priority: ${todo.priorityToString()}"),
        trailing: Checkbox(
            value: todo.completed,
            onChanged: (value) {
              onChangedChecked(value!);
            }),
      ),
    );
  }
}
