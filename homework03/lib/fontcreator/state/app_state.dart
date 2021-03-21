import 'dart:async';

import 'package:flutter/material.dart';

import '../helper/font_dto.dart';

class AppState extends InheritedWidget {
  final StreamController<FontDataDto> controller;
  final FontDataDto current = FontDataDto();
  final List<FontDataDto> dtos = [];

  AppState({required this.controller, required child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AppState of(BuildContext context) {
    final AppState? result =
        context.dependOnInheritedWidgetOfExactType<AppState>();
    assert(result != null, "No AppState found in context");
    return result!;
  }

  void addFont(FontDataDto dto) {
    dtos.add(dto);
    controller.add(dto);
  }

  void removeFont(FontDataDto dto) {
    print("Removing from list");
    print("Before: " +
        dtos.map((e) => "Size:${e.size}, Weight:${e.weight}").toString());
    dtos.remove(dto);
    print("After: " +
        dtos.map((e) => "Size:${e.size}, Weight:${e.weight}").toString());
    controller.add(dto);
  }
}
