import 'dart:async';

import 'package:flutter/material.dart';

import '../helper/font_dto.dart';

class FormStateProvider extends InheritedWidget {
  final StreamController<FontDataDto> controller;
  final FontDataDto current = FontDataDto();

  FormStateProvider({required this.controller, required child})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static FormStateProvider of(BuildContext context) {
    final FormStateProvider? result =
        context.dependOnInheritedWidgetOfExactType<FormStateProvider>();
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
