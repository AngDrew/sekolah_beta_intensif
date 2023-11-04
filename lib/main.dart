import 'package:flutter/material.dart';
import 'package:hello_world/src/features/note/note.dart';

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
      onGenerateRoute: (settings) {
        // jika perlu menambahkan custom transition, gunakan `PageRouteBuilder` disini:
        // if(settings.name == TestingPage.routeName)
        //   return PageRouteBuilder(...)

        // untuk mengurangi redundansi kode, kita bisa memisahkan routing seperti ini:
        // sehingga kita tidak harus menulis `MaterialPageRoute` di setiap route yang kita buat
        return MaterialPageRoute(
          builder: (context) {
            if (settings.name == NotesListView.routeName) {
              return const NotesListView();
            }
            if (settings.name == NoteDetailView.routeName) {
              // kita tahu bahwa route ini memerlukan arguments,
              // maka kita bisa mengambilnya dari `settings.arguments`
              final Object? args = settings.arguments;

              // dan melakukan pengecekan tipe data dari `args`
              // untuk memastikan bahwa kita mendapatkan arguments yang benar
              // dan menghindari human error seperti typo, dll.
              if (args is NoteDetailViewArguments) {
                return NoteDetailView(note: args.note);
              }

              return const Scaffold(
                body: Center(
                  child: Text(
                    'Missing arguments',
                  ),
                ),
              );
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
      },
    );
  }
}
