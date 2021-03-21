import 'package:flutter/material.dart';
import 'package:homework03/fontcreator/form/font_slider.dart';
import 'package:homework03/fontcreator/form/font_styler.dart';
import 'package:homework03/fontcreator/helper/font_dto.dart';
import 'package:homework03/fontcreator/state/app_state.dart';
import 'package:homework03/fontcreator/state/form_page.dart';

class FontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Your Font!")),
      floatingActionButton: _createButton(context),
      body: StreamBuilder(
        stream: FontFormProvider.of(context).controller.stream,
        initialData: FontFormProvider.of(context).current,
        builder: (context, AsyncSnapshot<FontDataDto?> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Data stream has error."));
          }
          if (!snapshot.hasData) {
            return Center(child: Text("No data provided"));
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: _createText(snapshot.data!)),
              Divider(thickness: 3),
              Expanded(
                flex: 3,
                child: _createMutators(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _createMutators() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FontSlider(),
        FontStyler(),
      ],
    );
  }

  FloatingActionButton _createButton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.check_circle_outline_rounded),
        onPressed: () {
          CreatedFontsProvider.of(context).addFont(
            FontDataDto.from(
                weight: FontFormProvider.of(context).getWeight(),
                size: FontFormProvider.of(context).getSize()),
          );
          Navigator.of(context).pop();
        });
  }

  Widget _createText(FontDataDto dto) {
    return Center(
      child: Text(
        dto.text,
        style: TextStyle(
          fontSize: dto.size,
          fontWeight: dto.weight,
        ),
      ),
    );
  }
}
