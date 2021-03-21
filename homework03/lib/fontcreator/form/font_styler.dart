import 'package:flutter/material.dart';

class FontStyler extends StatefulWidget {
  final ValueChanged<FontWeight?> callback;

  const FontStyler({Key? key, required this.callback}) : super(key: key);

  @override
  _FontStylerState createState() => _FontStylerState();
}

class _FontStylerState extends State<FontStyler> {
  FontWeight? _weight = FontWeight.normal;

  Widget _createRadioTile(
    BuildContext context,
    String title,
    FontWeight fontWeight,
  ) {
    return RadioListTile<FontWeight>(
      activeColor: Theme.of(context).colorScheme.secondary,
      title: Text(title),
      value: fontWeight,
      groupValue: _weight,
      onChanged: (FontWeight? value) => setState(() {
        _weight = value;
        widget.callback(_weight);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Change font style",
          style: Theme.of(context).textTheme.headline6,
        ),
        _createRadioTile(context, "Normal", FontWeight.normal),
        _createRadioTile(context, "Bold", FontWeight.bold),
      ],
    );
  }
}
