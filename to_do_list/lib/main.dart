import 'package:flutter/material.dart';
import '../ToDoList/to_do_list.dart';

void main() => runApp(
      ToDo(),
    );

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo list - Epitech Experience',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: TodoList(),
    );
  }
}
