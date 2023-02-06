import 'package:flutter/material.dart';

class Todo {
  Todo({required this.name, required this.checked});
  final String name;
  bool checked;
}

class ToDoTask extends StatelessWidget {
  ToDoTask({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;

  TextStyle? eraseTask(bool checked) {
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTodoChanged(todo);
      },
      leading: todo.checked
          ? const Icon(Icons.check_circle)
          : const Icon(Icons.radio_button_unchecked),
      title: Text(todo.name, style: eraseTask(todo.checked)),
    );
  }
}
