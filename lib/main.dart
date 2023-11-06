import 'package:flutter/material.dart';
import 'package:hello_world/src/features/note/note.dart';
import 'package:hello_world/src/services/routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // pastikan untuk memisahkan annonymous function ini: `(settings) {...}` pada file lain
      // karena kita mungkin akan memerlukan banyak routing untuk aplikasi yang akan kita buat
      onGenerateRoute: onGenerateRoute,
      // by default `initialRoute` adalah `/`
      initialRoute: NotesListView.routeName,
    );
  }
}
