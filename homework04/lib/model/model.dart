import 'package:flutter/foundation.dart';

@immutable
class NotesModel {
  final List<SingleNote> notes;
  final SingleNote noteForm;

  NotesModel(this.notes, this.noteForm);
}

@immutable
class SingleNote {
  final String name;
  final String text;

  SingleNote(this.name, this.text);

  @override
  String toString() {
    return "{$name: $text}";
  }
}
