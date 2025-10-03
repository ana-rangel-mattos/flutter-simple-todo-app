import 'package:flutter/material.dart';
import 'package:simple_todo_app/components/todos_text.dart';
import 'package:simple_todo_app/models/todo.dart';
import 'package:simple_todo_app/screens/no_todos_screen.dart';
import 'package:simple_todo_app/components/todo_item.dart';
import 'package:simple_todo_app/components/todo_radio.dart';
import 'package:simple_todo_app/components/add_todo_button.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final todoTitleController = TextEditingController();

  int counter = 1;
  TodoPriority priority = TodoPriority.medium;
  static List<Todo> todos = [];

  void onShowBottomModal() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext builder) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: Colors.lightGreen[200],
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: todoTitleController,
                        decoration: InputDecoration(
                          label: TodosText("To do Title"),
                          hint: Text("To do description goes here..."),
                          icon: Icon(Icons.text_snippet_outlined),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TodosText("Todo Priority"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 30),
                        child: Row(
                          children: [
                            TodoRadio(
                              priority,
                              radioValue: TodoPriority.low,
                              priorityName: "Low",
                              onChanged: (TodoPriority value) {
                                setState(() {
                                  priority = value;
                                });
                              },
                            ),
                            TodoRadio(
                              priority,
                              radioValue: TodoPriority.medium,
                              priorityName: "Medium",
                              onChanged: (TodoPriority value) {
                                setState(() {
                                  priority = value;
                                });
                              },
                            ),
                            TodoRadio(
                              priority,
                              radioValue: TodoPriority.high,
                              priorityName: "High",
                              onChanged: (TodoPriority value) {
                                setState(() {
                                  priority = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => handleAddTodo(context),
                        child: TodosText("Add new To do"),
                      ),
                    ],
                  ),
                ),
              );
            }
        );
      },
      isScrollControlled: true,
    );
  }

  void handleAddTodo(BuildContext context) {
    if (todoTitleController.text == "") {
      noTitleDialog(context);
      return;
    }

    String title = todoTitleController.text;
    Todo newTodo = Todo(id: counter, title: title, priority: priority);
    todos.add(newTodo);

    setState(() {
      todoTitleController.clear();
      priority = TodoPriority.medium;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My ToDos"),
        backgroundColor: Colors.lightGreen,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AddTodoButton(addTodo: onShowBottomModal),
      body: Center(
        child: todos.isEmpty ? NoTodosScreen() :
        ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            Todo currentTodo = todos[index];

            return TodoItem(
              index,
              todo: currentTodo,
              onChangedChecked: (bool value) {
                setState(() {
                  currentTodo.completed = value;
                });
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> noTitleDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const TodosText("Title is mandatory"),
          content: const TodosText("Please fill the title field."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      }
    );
  }
}
