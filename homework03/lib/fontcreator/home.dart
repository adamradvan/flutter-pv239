import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework03/fontcreator/state/app_state.dart';
import 'package:homework03/fontcreator/font_card.dart';
import 'package:homework03/fontcreator/form/font_creation.dart';
import 'package:homework03/fontcreator/helper/font_dto.dart';

class FontCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppState(
      streamController: StreamController<FontDataDto>(),
      child: MaterialApp(
        title: 'Font Creator',
        theme: ThemeData.from(colorScheme: ColorScheme.dark()),
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Font Creator"),
      ),
      body: _createBody(context),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add Font"),
        icon: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => FontPage()),
        ),
      ),
    );
  }

  Widget _createPlaceholder(BuildContext context, String textToDisplay) {
    return Center(
      child: Text(
        textToDisplay,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget _createBody(BuildContext context) {
    return StreamBuilder(
        stream: AppState.of(context).streamController.stream,
        builder: (context, AsyncSnapshot<FontDataDto?> snapshot) {
          List<FontDataDto> dtos = AppState.of(context).dtos;
          if (snapshot.hasError) {
            return _createPlaceholder(context, "Data stream has error.");
          }
          if (dtos.isEmpty) {
            return _createPlaceholder(context, "Please create a font.");
          }

          return ListView(
              children: dtos
                  .map((value) => FontCard(
                        dto: value,
                        deleteCallback: () =>
                            AppState.of(context).removeFont(value),
                      ))
                  .toList());
        });
  }
}
