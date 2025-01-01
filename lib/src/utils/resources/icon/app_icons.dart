// Place fonts/app.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: app
//      fonts:
//       - asset: fonts/app.ttf
import 'package:flutter/widgets.dart';

class App {
  App._();

  static const String _fontFamily = 'app';

  static const IconData salah = IconData(0xe904, fontFamily: _fontFamily);
  static const IconData idea = IconData(0xe905, fontFamily: _fontFamily);
  static const IconData kaaba = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData profileRounded = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData quran = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData ai = IconData(0xe903, fontFamily: _fontFamily);
}
