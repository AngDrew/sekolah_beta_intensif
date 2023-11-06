import 'package:flutter/material.dart';
import 'package:hello_world/src/features/note/note_detail_view.dart';

import 'note_model.dart';

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
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Note 1'),
            subtitle: const Text('Note 1 subtitle'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const NoteDetailView(
                    note: NoteModel(title: 'ini title', content: 'ini content'),
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Note 2'),
            subtitle: const Text('Note 2 subtitle'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Note 3'),
            subtitle: const Text('Note 3 subtitle'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget functionBuilder(BuildContext context) => const NoteDetailView(
        note: NoteModel(title: 'ini title', content: 'ini content'),
      );
}
