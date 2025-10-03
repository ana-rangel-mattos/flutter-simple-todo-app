import 'package:flutter/material.dart';
import 'package:simple_todo_app/models/todo.dart';
import 'package:simple_todo_app/components/todos_text.dart';

class TodoRadio extends StatefulWidget {
  const TodoRadio(this.groupValue, {super.key, required this.radioValue, required this.priorityName, required this.onChanged});

  final TodoPriority groupValue;
  final TodoPriority radioValue;
  final String priorityName;
  final Function(TodoPriority) onChanged;

  @override
  State<TodoRadio> createState() => _TodoRadioState();
}

class _TodoRadioState extends State<TodoRadio> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<TodoPriority>(
          value: widget.radioValue,
          groupValue: widget.groupValue,
          onChanged: (value) {
            widget.onChanged(value!);
          },
        ),
        TodosText(widget.priorityName),
      ],
    );
  }
}
