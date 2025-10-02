class Todo {
  int id;
  String title;
  TodoPriority priority;
  bool completed;

  Todo({
    required this.id,
    required this.title,
    required this.priority,
    this.completed = false,
  });

  static List<Todo> todos = [];
}

enum TodoPriority {
  high, medium, low
}