import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  static ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;
  static bool _isDark = true;
  void toggleMode() {
    _isDark = !_isDark;
    notifyListeners();
  }

  static MaterialColor primaryColor =
      const MaterialColor(0xFF0D47A1, <int, Color>{
    50: Color(0xFF0D47A1),
    100: Color(0xFF0D47A1),
    200: Color(0xFF0D47A1),
    300: Color(0xFF0D47A1),
    400: Color(0xFF0D47A1),
    500: Color(0xFF0D47A1),
    600: Color(0xFF0D47A1),
    700: Color(0xFF0D47A1),
    800: Color(0xFF0D47A1),
    900: Color(0xFF0D47A1),
  });

  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: Colors.blue[900],
        primarySwatch: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat', //3
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.blue[900],
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: Colors.blue[900],
        primarySwatch: primaryColor,
        fontFamily: 'Montserrat',
        textTheme: TextTheme(),
        scaffoldBackgroundColor: Colors.black,
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.blue[900],
        ));
  }
}
