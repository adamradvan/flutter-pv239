import 'package:flutter/material.dart';
import 'package:homework03/fontcreator/state/form_page.dart';

class FontSlider extends StatelessWidget {
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
          value: FontFormProvider.of(context).getSize(),
          min: 8,
          max: 30,
          divisions: 11,
          label: FontFormProvider.of(context).getSize().round().toString(),
          onChanged: (double value) => FontFormProvider.of(context).size(value),
        ),
      ],
    );
  }
}
