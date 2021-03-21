import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'font_dto.dart';

class AppState extends InheritedWidget {
  final StreamController<FontDataDto> streamController;
  final List<FontDataDto> dtos = [];

  AppState({required this.streamController, required child})
      : super(child: child);

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
    streamController.add(dto);
  }

  void removeFont(FontDataDto dto) {
    print("Removing from list");
    print("Before: " +
        dtos.map((e) => "Size:${e.size}, Weight:${e.weight}").toString());
    dtos.remove(dto);
    print("After: " +
        dtos.map((e) => "Size:${e.size}, Weight:${e.weight}").toString());
    streamController.add(dto);
  }
}
