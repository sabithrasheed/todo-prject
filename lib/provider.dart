import 'package:flutter/material.dart';
import 'package:todo_app/models.dart';
import 'package:todo_app/rep.dart';

class TodoProvider extends ChangeNotifier {
  final TodoRepository _todoRepository = TodoRepository();

  TodoProvider() {
    _init();
  }

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<void> _init() async {
    await _todoRepository.openBox();
    await _fetchTodos();
  }

  Future<void> _fetchTodos() async {
    _todos = _todoRepository.getTodos();
    notifyListeners();
  }

  Future<void> addTodo(String title, String date) async {
    final newTodo = Todo(
      title: title,
      date: date,
    );
    await _todoRepository.addTodo(newTodo);
    await _fetchTodos();
  }

  void toggleTodoStatus(int index) {
    _todoRepository.toggleTodoStatus(index);
    _fetchTodos();
  }

  void deleteTodo(int index) {
    _todoRepository.deleteTodo(index);
    _fetchTodos();
  }

  void updateTodoTitle(int index, String newTitle, String newDescription) {
    _todos[index].title = newTitle;
    _todos[index].date = newDescription;
    notifyListeners();
  }
}
