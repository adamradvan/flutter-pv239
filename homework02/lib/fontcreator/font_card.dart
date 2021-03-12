import 'package:flutter/material.dart';
import 'package:homework02/fontcreator/font_dto.dart';

class FontCard extends StatelessWidget {
  final FontDataDto dto;
  final VoidCallback deleteCallback;

  const FontCard({
    Key? key,
    required this.dto,
    required this.deleteCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onLongPress: deleteCallback,
        title: Text(
          dto.text,
          style: TextStyle(
            fontSize: dto.size,
            fontWeight: dto.weight,
          ),
        ),
      ),
    );
  }
}
