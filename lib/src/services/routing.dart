import 'package:flutter/material.dart';
import 'package:hello_world/src/features/todo/add_todo_view.dart';
import 'package:hello_world/src/features/todo/todo_view.dart';

import '../features/note/note.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // jika perlu menambahkan custom transition, gunakan `PageRouteBuilder` disini:
  // if(settings.name == TestingPage.routeName)
  //   return PageRouteBuilder(...)
  String name = settings.name ?? '';

  // untuk mengurangi redundansi kode, kita bisa memisahkan routing seperti ini:
  // sehingga kita tidak harus menulis `MaterialPageRoute` di setiap route yang kita buat
  return MaterialPageRoute<dynamic>(
    builder: (context) {
      
      // if (name == '/') {
      //   return const NotesListView();
      // }
      if (name == '/') {
        return const TodoView();
      }
      if (name == NoteDetailView.routeName) {
        // kita tahu bahwa route ini memerlukan arguments,
        // maka kita bisa mengambilnya dari `settings.arguments`
        final Object? args = settings.arguments;

        // dan melakukan pengecekan tipe data dari `args`
        // untuk memastikan bahwa kita mendapatkan arguments yang benar
        // dan menghindari human error seperti typo, dll.
        if (args is NoteDetailViewArguments) {
          return NoteDetailView(note: args.note);
        }

        return const MissingArgumentView();
      }
      if (name == AddTodoView.routeName) {
        return const AddTodoView();
      }

      return const Scaffold(
        body: Center(
          child: Text(
            '404 Not found',
          ),
        ),
      );
    },
  );
}

class MissingArgumentView extends StatelessWidget {
  const MissingArgumentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Missing arguments',
        ),
      ),
    );
  }
}
