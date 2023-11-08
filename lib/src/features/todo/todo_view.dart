import 'package:flutter/material.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  static const String routeName = '/todo_view';

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  // private
  final List<bool> _todos = [];

  // public
  final List<bool> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: _todos
              .map(
                (element) => CheckboxListTile.adaptive(
                  value: element,
                  onChanged: (newValue) {
                    _todos[_todos.indexOf(element)] = newValue ?? false;
                    // setState(() {
                    //   _todos[_todos.indexOf(element)] = newValue ?? false;
                    // });
                  },
                  title: Text('Todo ${_todos.indexOf(element)}'),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

void testingFunction() {
  // contoh penggunaan private class
  _TodoViewState().todos;

  // segala sesuatu yang dimulai dengan _ itu private
  // private class, private variable, private function
  // private artinya hanya bisa diakses di dalam file itu saja atau di dalam class itu saja
}
