import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hello_world/src/features/todo/add_todo_view.dart';
import 'package:hello_world/src/features/todo/todo_model.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  static const String routeName = '/todo_view';

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  // private
  final List<TodoModel> _todos = [];

  void Function() testing = () {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            ElevatedButton(
              onPressed: () async {
                Object? todoResult = await Navigator.pushNamed(context, AddTodoView.routeName);
                if (todoResult is! TodoModel) return;

                setState(() {
                  _todos.add(todoResult);
                });
              },
              child: const Text('Add Todo'),
            ),
            for (final todo in _todos)
              ListTile(
                title: Text(todo.name),
                trailing: Checkbox(
                  value: todo.selected,
                  onChanged: (bool? newValue) {
                    setState(() {
                      todo.selected = newValue;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
