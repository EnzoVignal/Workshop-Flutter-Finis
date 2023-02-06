import 'package:flutter/material.dart';
import '../ToDoTask/to_do_task.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => new _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];

  void addTask(String name) {
    setState(() {
      _todos.add(Todo(name: name, checked: false));
    });
    _textFieldController.clear();
  }

  void handleToDo(Todo todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  Future<void> boxTask() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new task'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new task'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                addTask(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list - Epitech Experience'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: _todos.map((Todo todo) {
          return ToDoTask(
            todo: todo,
            onTodoChanged: handleToDo,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => boxTask(),
          tooltip: 'Add Item',
          child: const Icon(Icons.add)),
    );
  }
}
