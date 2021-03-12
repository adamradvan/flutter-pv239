import 'package:flutter/material.dart';

@immutable
class FontDataDto {
  final String text;
  final FontWeight weight;
  final double size;

  FontDataDto({required this.text, required this.weight, required this.size});
}
