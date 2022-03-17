class Task {
  final int id;
  final String content;
  late final bool completed;
  final DateTime createdAt;

  Task(this.id, this.content, this.completed, this.createdAt);

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        content = json['title'],
        completed = json['completed'],
        createdAt = DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'completed': completed,
        'createdAt': createdAt,
      };
}
