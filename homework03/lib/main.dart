import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homework03/fontcreator/home/home_screen.dart';

void main() {
  // forbid landscape mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(FontCreator());
}
