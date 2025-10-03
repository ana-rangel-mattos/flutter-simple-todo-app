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
    switch (priority) {
      case TodoPriority.low:
        return "Low";
      case TodoPriority.medium:
        return "Medium";
      case TodoPriority.high:
        return "High";
    }
  }
}

enum TodoPriority {
  high, medium, low
}