import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework04/bloc/cubit.dart';
import 'package:homework04/model/model.dart';
import 'package:homework04/screens/note_detail_page.dart';
import 'package:homework04/screens/note_form_page.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NotesCubit _cubit = context.read<NotesCubit>();

    return BlocBuilder<NotesCubit, NotesModel>(
      builder: (context, NotesModel model) => Scaffold(
        appBar: AppBar(title: Text("BLoC showcase")),
        body: ListView(
          children: _cubit.state.notes
              .map((note) => _createListCard(_cubit, note, context))
              .toList(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NoteForm(),
            ));
          },
        ),
      ),
    );
  }

  Widget _createListCard(
    NotesCubit _cubit,
    SingleNote note,
    BuildContext context,
  ) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      borderOnForeground: true,
      child: ListTile(
        title: Text(note.name),
        onLongPress: () => _cubit.removeNote(note),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NoteDetail(note: note),
          ),
        ),
      ),
    );
  }
}
