import 'dart:async';

import 'package:flutter/material.dart';

import '../helper/font_dto.dart';

class CreatedFontsProvider extends InheritedWidget {
  final StreamController<List<FontDataDto>> controller;
  final List<FontDataDto> fonts = [];

  CreatedFontsProvider({
    required this.controller,
    required child,
  }) : super(child: child);

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
    _sendEventToStream();
  }

  void removeFont(FontDataDto dto) {
    fonts.remove(dto);
    _sendEventToStream();
  }

  void _sendEventToStream() {
    controller.add(fonts);
  }
}
