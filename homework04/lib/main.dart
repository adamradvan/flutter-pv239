import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework04/bloc/cubit.dart';
import 'package:homework04/screens/notes_page.dart';

void main() {
  // forbid landscape mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotesCubit>(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.from(colorScheme: ColorScheme.dark()),
        home: NotesPage(),
      ),
    );
  }
}
