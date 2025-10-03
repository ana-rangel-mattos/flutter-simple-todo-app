import 'package:flutter/material.dart';
import 'package:simple_todo_app/components/todos_text.dart';
import 'package:simple_todo_app/models/todo.dart';
import 'package:simple_todo_app/screens/no_todos_screen.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext builder) {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    color: Colors.lightGreen[200],
                    child: Padding(
                      padding: const EdgeInsets.all(20),
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
                                Radio<TodoPriority>(
                                  value: TodoPriority.low,
                                  groupValue: priority,
                                  onChanged: (value) {
                                    setState(() {
                                      priority = value!;
                                    });
                                  },
                                ),
                                TodosText("Low"),
                                Radio<TodoPriority>(
                                  value: TodoPriority.medium,
                                  groupValue: priority,
                                  onChanged: (value) {
                                    setState(() {
                                      priority = value!;
                                    });
                                  },
                                ),
                                TodosText("Medium"),
                                Radio<TodoPriority>(
                                  value: TodoPriority.high,
                                  groupValue: priority,
                                  onChanged: (value) {
                                    setState(() {
                                      priority = value!;
                                    });
                                  },
                                ),
                                TodosText("High"),
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
          );
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: Center(
        child: todos.isEmpty ? NoTodosScreen() :
        ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(4),
            child: ListTile(
              tileColor: index.isEven ? Colors.lightGreen[200] : Colors.grey[200],
              title: TodosText(todos[index].title),
              subtitle: Text("Priority: ${todos[index].priorityToString()}"),
              trailing: Checkbox(
                value: todos[index].completed,
                onChanged: (value) {
                  setState(() {
                    todos[index].completed = value!;
                  });
              }),
            ),
          ),
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
