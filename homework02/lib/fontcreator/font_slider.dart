import 'package:flutter/material.dart';

class FontSlider extends StatefulWidget {
  final ValueChanged<double> callback;

  const FontSlider({Key? key, required this.callback}) : super(key: key);

  @override
  _FontSliderState createState() => _FontSliderState();
}

class _FontSliderState extends State<FontSlider> {
  double _currentSize = 8;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Change font size",
          style: Theme.of(context).textTheme.headline6,
        ),
        Slider(
          activeColor: Theme.of(context).colorScheme.secondary,
          value: _currentSize,
          min: 8,
          max: 30,
          divisions: 11,
          label: _currentSize.round().toString(),
          onChanged: (double value) => setState(() {
            _currentSize = value;
            widget.callback(_currentSize);
          }),
        )
      ],
    );
  }
}
