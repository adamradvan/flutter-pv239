import 'package:flutter/material.dart';
import 'package:homework04/model/model.dart';

class NoteDetail extends StatelessWidget {
  final SingleNote note;

  const NoteDetail({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BLoC showcase")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              note.name,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Divider(thickness: 3.0),
          Center(
            child: Text(
              note.text,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
