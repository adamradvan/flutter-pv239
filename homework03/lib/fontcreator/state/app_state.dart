import 'dart:async';

import 'package:flutter/material.dart';

import '../helper/font_dto.dart';

class CreatedFontsProvider extends InheritedWidget {
  final StreamController<List<FontDataDto>> controller;
  final List<FontDataDto> fonts = [];

  CreatedFontsProvider({required this.controller, required child})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CreatedFontsProvider of(BuildContext context) {
    final CreatedFontsProvider? result =
        context.dependOnInheritedWidgetOfExactType<CreatedFontsProvider>();
    assert(result != null, "No AppState found in context");
    return result!;
  }

  void addFont(FontDataDto dto) {
    fonts.add(dto);
    sendEventToStream();
  }

  void removeFont(FontDataDto dto) {
    print("Removing from list");
    print("Before: " +
        fonts.map((e) => "Size:${e.size}, Weight:${e.weight}").toString());
    fonts.remove(dto);
    print("After: " +
        fonts.map((e) => "Size:${e.size}, Weight:${e.weight}").toString());
    sendEventToStream();
  }

  void sendEventToStream() {
    controller.add(fonts);
  }
}
