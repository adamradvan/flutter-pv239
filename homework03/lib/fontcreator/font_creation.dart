import 'package:flutter/material.dart';
import 'package:homework03/fontcreator/font_dto.dart';
import 'package:homework03/fontcreator/font_slider.dart';
import 'package:homework03/fontcreator/font_styler.dart';
import 'package:homework03/fontcreator/state_holder.dart';

class FontPage extends StatefulWidget {
  @override
  _FontPageState createState() => _FontPageState();
}

class _FontPageState extends State<FontPage> {
  static final String displayedText = "Hello Flutter";
  FontWeight? _weight = FontWeight.normal;
  double _currentSize = 8;

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
        displayedText,
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
              FontDataDto(
                  text: displayedText, weight: _weight!, size: _currentSize),
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
