class Todo {
  String title;
  String description;
  DateTime due;
  bool done;

  Todo({this.title, this.description, this.due, this.done: false});

  String toString() => "$title  ($done) - $description - $due";
}