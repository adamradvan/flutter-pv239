import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:homework04/model/model.dart';

class NotesCubit extends Cubit<NotesModel> {
  static SingleNote _emptyForm = SingleNote("", "");

  NotesCubit() : super(NotesModel([], _emptyForm));

  void createNote() {
    NotesModel newState = NotesModel(
      UnmodifiableListView([...state.notes, state.noteForm]),
      state.noteForm,
    );
    emit(newState);
  }

  void removeNote(SingleNote forRemoval) {
    NotesModel newState = NotesModel(
      UnmodifiableListView(List.of(state.notes)..remove(forRemoval)),
      state.noteForm,
    );
    emit(newState);
  }

  void setNoteName(String newName) {
    NotesModel newState = NotesModel(
      UnmodifiableListView([...state.notes]),
      SingleNote(newName, state.noteForm.text),
    );
    emit(newState);
  }

  void setNoteText(String newText) {
    NotesModel newState = NotesModel(
      UnmodifiableListView([...state.notes]),
      SingleNote(state.noteForm.name, newText),
    );
    emit(newState);
  }

  void clearForm() {
    NotesModel newState = NotesModel(
      UnmodifiableListView([...state.notes]),
      _emptyForm,
    );
    emit(newState);
  }
}
