import 'package:flutter/material.dart';
import 'package:hello_world/src/features/note/note.dart';
import 'package:hello_world/src/features/note/note_detail_view.dart';

import 'note_model.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  static String routeName = '/notes_list_view';

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  List<NoteModel> notes = [
    const NoteModel(title: 'title1', content: 'content 1'),
    const NoteModel(title: 'title2', content: 'content 2'),
    const NoteModel(title: 'title3', content: 'content 3'),
    const NoteModel(title: 'title4', content: 'content 4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: ListView(
        children: <Widget>[
          for (final note in notes) NoteTile(note: note),
        ],
      ),
    );
  }

  Widget functionBuilder(BuildContext context) => const NoteDetailView(
        note: NoteModel(title: 'ini title', content: 'ini content'),
      );
}
