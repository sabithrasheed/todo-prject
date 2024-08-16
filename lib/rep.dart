import 'package:hive/hive.dart';
import 'package:todo_app/models.dart';

class TodoRepository {
  late Box _todoBox;

  Future<void> openBox() async {
    _todoBox = await Hive.openBox('todos');
  }

  Future<void> addTodo(Todo todo) async {
    await _todoBox.add(todo.toMap());
  }

  List<Todo> getTodos() {
    return _todoBox.values
        .map((element) => Todo.fromMap(Map<String, dynamic>.from(element)))
        .toList();
  }

  void toggleTodoStatus(int index) {
    var todo = Map<String, dynamic>.from(_todoBox.getAt(index));
    todo['isDone'] = !todo['isDone'];
    _todoBox.putAt(index, todo);
  }

  void deleteTodo(int index) {
    _todoBox.deleteAt(index);
  }
}
