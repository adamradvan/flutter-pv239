import 'package:flutter/material.dart';
import 'package:homework02/fontcreator/font_card.dart';
import 'package:homework02/fontcreator/font_creation.dart';
import 'package:homework02/fontcreator/font_dto.dart';

class FontCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Font Creator',
      theme: ThemeData.from(colorScheme: ColorScheme.dark()),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FontDataDto> _fontDtos = [];

  void _onPressedButton() async {
    final FontDataDto? dto = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => FontPage(),
      ),
    );
    if (dto != null) {
      setState(() => _fontDtos = List.from(_fontDtos)..add(dto));
    }
  }

  void _removeCard(int index) {
    setState(() {
      _fontDtos = List.from(_fontDtos)..removeAt(index);
    });
  }

  Widget _createPlaceholder() {
    return Center(
      child: Text(
        'Please create a font.',
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget _createBody() {
    if (_fontDtos.isEmpty) return _createPlaceholder();
    return ListView(
        children: _fontDtos
            .asMap() // converting to Map because List.map() does not provide index
            .map(
              (index, value) => MapEntry(
                index,
                FontCard(dto: value, deleteCallback: () => _removeCard(index)),
              ),
            )
            .values // additional handling to convert from map to list
            .cast<Widget>()
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Font Creator"),
      ),
      body: _createBody(),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add Font"),
        icon: Icon(Icons.add),
        onPressed: _onPressedButton,
      ),
    );
  }
}
