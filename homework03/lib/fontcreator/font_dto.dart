import 'package:flutter/material.dart';
import 'package:homework03/fontcreator/constants.dart';

class FontDataDto {
  final String text = AppConstants.DEFAULT_MESSAGE;
  FontWeight weight = AppConstants.DEFAULT_FONT_WEIGHT;
  double size = AppConstants.DEFAULT_FONT_SIZE;

  FontDataDto();

  static FontDataDto from({required FontWeight weight, required double size}) {
    FontDataDto dto = FontDataDto();
    dto.weight = weight;
    dto.size = size;
    return dto;
  }
}
