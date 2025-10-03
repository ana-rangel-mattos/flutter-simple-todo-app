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

  String priorityToString() {
    return priority.name[0].toUpperCase() + priority.name.substring(1).toLowerCase();
  }
}

enum TodoPriority {
  high, medium, low
}