import 'package:flutter/material.dart';
import 'package:hello_world/src/features/note/note.dart';

class NoteDetailView extends StatelessWidget {
  const NoteDetailView({
    required this.note,
    super.key,
  });

  static const String routeName = '/note_detail_view';

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note detail'),
      ),
      body: ListView(
        children: <Widget>[
          Text(note.title),
          Text(note.content),
        ],
      ),
    );
  }
}

// untuk mempertahankan konsistensi, kita bisa membuat class `Arguments` seperti ini
// tujuannya supaya kita bisa membatasi tipe data yang bisa di-passing ke route
// dan juga mempermudah tracing & debugging
class NoteDetailViewArguments {
  const NoteDetailViewArguments({required this.note});

  final NoteModel note;
}
