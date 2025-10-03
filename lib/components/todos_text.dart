import 'package:flutter/material.dart';

class TodosText extends StatelessWidget {
  const TodosText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
