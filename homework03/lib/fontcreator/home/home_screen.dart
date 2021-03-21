import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework03/fontcreator/home/font_card.dart';
import 'package:homework03/fontcreator/form/font_creation.dart';
import 'package:homework03/fontcreator/helper/font_dto.dart';
import 'package:homework03/fontcreator/state/app_state.dart';
import 'package:homework03/fontcreator/state/form_page.dart';

class FontCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CreatedFontsProvider(
      controller: StreamController<List<FontDataDto>>(),
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
          MaterialPageRoute(
            builder: (BuildContext context) => FontFormProvider(
              controller: StreamController<FontDataDto>(),
              child: FontPage(),
            ),
          ),
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
        stream: CreatedFontsProvider.of(context).controller.stream,
        builder: (context, AsyncSnapshot<List<FontDataDto>?> snapshot) {
          if (snapshot.hasError) {
            return _createPlaceholder(context, "Data stream has error.");
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return _createPlaceholder(context, "Please create a font.");
          }

          return ListView(
              children: snapshot.data!
                  .map((value) => FontCard(
                        dto: value,
                        deleteCallback: () =>
                            CreatedFontsProvider.of(context).removeFont(value),
                      ))
                  .toList());
        });
  }
}
