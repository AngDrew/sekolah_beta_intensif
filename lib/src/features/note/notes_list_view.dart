import 'package:flutter/material.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  static String routeName = '/notes_list_view';

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: const SizedBox.shrink(),
    );
  }
}