class Todo {
  late String title;
  late String date;
  late bool isDone;

  Todo({
    required this.title,
    required this.date,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
      'isDone': isDone,
    };
  }

  static Todo fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'],
      date: map['date'],
      isDone: map['isDone'],
    );
  }
}
