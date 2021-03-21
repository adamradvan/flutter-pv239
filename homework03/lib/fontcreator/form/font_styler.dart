import 'package:flutter/material.dart';
import 'package:homework03/fontcreator/state/form_page.dart';

class FontStyler extends StatelessWidget {
  Widget _createRadioTile(
    BuildContext context,
    String title,
    FontWeight fontWeight,
  ) {
    return RadioListTile<FontWeight>(
      activeColor: Theme.of(context).colorScheme.secondary,
      title: Text(title),
      value: fontWeight,
      groupValue: FontFormProvider.of(context).getWeight(),
      onChanged: (FontWeight? value) {
        if (value == null) return;
        FontFormProvider.of(context).weight(value);
      },
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
