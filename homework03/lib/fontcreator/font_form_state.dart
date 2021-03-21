import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'font_dto.dart';

class FontFormState extends InheritedWidget {
  final StreamController<FontDataDto> controller;
  final FontDataDto dto = FontDataDto();

  FontFormState({required this.controller, required child})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static FontFormState of(BuildContext context) {
    final FontFormState? result =
        context.dependOnInheritedWidgetOfExactType<FontFormState>();
    assert(result != null, "No FontFormState found in context");
    return result!;
  }

  void weight(FontWeight weight) {
    dto.weight = weight;
    controller.add(dto);
  }

  void size(double size) {
    dto.size = size;
    controller.add(dto);
  }
}
