import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hello_world/src/features/note/note.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.title),
      subtitle: Text(note.content),
      onTap: () async {
        final nomorAjaib = await Navigator.pushNamed(
          context,
          NoteDetailView.routeName,
          arguments: NoteDetailViewArguments(note: note),
        );
        log(nomorAjaib.toString());
      },
    );
  }
}