class Task {
  final String id;
  late final String title;
  late final String description;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}

