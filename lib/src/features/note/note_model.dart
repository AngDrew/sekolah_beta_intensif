class NoteModel {
  const NoteModel({
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  String toString() {
    return title;
  }
}
