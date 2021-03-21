import 'package:flutter/material.dart';
import 'package:homework03/fontcreator/form/font_slider.dart';
import 'package:homework03/fontcreator/form/font_styler.dart';
import 'package:homework03/fontcreator/helper/font_dto.dart';
import 'package:homework03/fontcreator/state/app_state.dart';

import '../helper/constants.dart';

class FontPageStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  FontPageStateless withState() {
    return new FontPageStateless();
  }
}

class FontPage extends StatefulWidget {
  @override
  _FontPageState createState() => _FontPageState();
}

class _FontPageState extends State<FontPage> {
  FontWeight? _weight = AppConstants.DEFAULT_FONT_WEIGHT;
  double _currentSize = AppConstants.DEFAULT_FONT_SIZE;

  void _changeFontSize(double size) {
    setState(() {
      _currentSize = size;
    });
  }

  void _changeFontStyle(FontWeight? weight) {
    setState(() {
      if (weight != null) _weight = weight;
    });
  }

  Widget _createText() {
    return Center(
      child: Text(
        AppConstants.DEFAULT_MESSAGE,
        style: TextStyle(
          fontSize: _currentSize,
          fontWeight: _weight,
        ),
      ),
    );
  }

  Widget _createMutators() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FontSlider(callback: _changeFontSize),
        FontStyler(callback: _changeFontStyle),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Your Font!")),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check_circle_outline_rounded),
          onPressed: () {
            AppState.of(context).addFont(
              FontDataDto.from(weight: _weight!, size: _currentSize),
            );
            Navigator.of(context).pop();
          }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: _createText()),
          Divider(thickness: 3),
          Expanded(
            flex: 3,
            child: _createMutators(),
          ),
        ],
      ),
    );
  }
}
