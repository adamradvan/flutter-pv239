import 'dart:async';

import 'package:flutter/material.dart';

import '../helper/font_dto.dart';

class FontFormProvider extends InheritedWidget {
  final StreamController<FontDataDto> controller;
  final FontDataDto current = FontDataDto();

  FontFormProvider({required this.controller, required child})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static FontFormProvider of(BuildContext context) {
    final FontFormProvider? result =
        context.dependOnInheritedWidgetOfExactType<FontFormProvider>();
    assert(result != null, "No AppState found in context");
    return result!;
  }

  FontWeight getWeight() {
    return current.weight;
  }

  double getSize() {
    return current.size;
  }

  void weight(FontWeight weight) {
    print("Set weight to $weight");
    current.weight = weight;
    controller.add(current);
  }

  void size(double size) {
    print("Set size to $size");
    current.size = size;
    controller.add(current);
  }
}
