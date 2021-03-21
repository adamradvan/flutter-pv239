import 'dart:async';

import 'package:flutter/material.dart';

import '../helper/font_dto.dart';

class FontFormProvider extends InheritedWidget {
  final StreamController<FontDataDto> controller;
  final FontDataDto current = FontDataDto();

  FontFormProvider({
    required this.controller,
    required child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static FontFormProvider of(BuildContext context) {
    final FontFormProvider? result =
        context.dependOnInheritedWidgetOfExactType<FontFormProvider>();
    assert(result != null, "No AppState found in context");
    return result!;
  }

  void newFontWeight(FontWeight weight) {
    current.weight = weight;
    _sendEventToStream();
  }

  void newFontSize(double size) {
    current.size = size;
    _sendEventToStream();
  }

  FontWeight getWeight() {
    return current.weight;
  }

  double getSize() {
    return current.size;
  }

  void _sendEventToStream() {
    controller.add(current);
  }
}
