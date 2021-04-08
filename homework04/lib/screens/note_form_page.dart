import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework04/bloc/cubit.dart';
import 'package:homework04/model/model.dart';

class NoteForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<NotesCubit>();
    final focusScope = FocusScope.of(context);

    return BlocBuilder<NotesCubit, NotesModel>(
      builder: (context, NotesModel model) => Scaffold(
        appBar: AppBar(title: Text("BLoC showcase")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onChanged: (text) => _cubit.setNoteName(text),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.assignment_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => focusScope.unfocus(),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.text_fields),
                  border: OutlineInputBorder(),
                  labelText: "Note's Text",
                ),
                onChanged: (text) => _cubit.setNoteText(text),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text("ADD NOTE"),
          icon: Icon(Icons.check_circle_outline_rounded),
          onPressed: () {
            if (_cubit.state.noteForm.name.isNotEmpty) {
              _cubit.createNote();
            }
            _cubit.clearForm();
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
