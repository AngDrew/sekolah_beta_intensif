import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hello_world/src/features/todo/todo_model.dart';

class AddTodoView extends StatefulWidget {
  const AddTodoView({super.key});

  static const String routeName = '/add_todo_view';

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  bool? todoState = false;

  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Checkbox(
            value: todoState,
            onChanged: (bool? newValue) {
              // log('$todoState');
              todoState = newValue;
              setState(() {});
              log('$todoState');
            },
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Todo', labelText: 'Title todo'),
            controller: controller,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
                (controller.text.isNotEmpty)
                    ? TodoModel(name: controller.text, selected: todoState)
                    : null,
              );
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
