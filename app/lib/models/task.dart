//this is a model of how the tasks will look like
//thats why it is in the models folder

class Task {
  int id;
  String title;
  String description;
  bool isDone;
  Task(
      {required this.id,
      required this.title,
      required this.description,
      this.isDone = false});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone ? 1 : 0,
    };
  }
}
