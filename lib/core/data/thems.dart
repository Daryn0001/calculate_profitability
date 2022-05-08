import 'package:flutter/material.dart';

class ThemProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode == ThemeMode.light;

  void toggleThem(bool isOne) {
    themeMode = isOne ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Mytheme {
  static final darkthem = ThemeData(
      textTheme: const TextTheme(
        displayMedium: TextStyle(color: Colors.white,),
      ),
      scaffoldBackgroundColor: const Color(0xff7f8cb6),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff3450A1)),
      primaryColor: Colors.white,
      cardColor: const Color(0xff0A155A),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFFF00FF)));

  static final lightthem = ThemeData(
    textTheme: const TextTheme(
      displayMedium: TextStyle(color: Colors.black,),
    ),// E26A2C F4F6FD
    scaffoldBackgroundColor: const Color(0xffF4F6FD),
    primaryColor: Colors.black,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF002FFF)),
    appBarTheme: //const AppBarTheme(backgroundColor: Color(0xff3450A1)), ff0A155A
    // ! FF548CFF
    const AppBarTheme(backgroundColor: Color(0xFF548CFF)),
  ); // ? DA1212  FF5151  3D0000   FF8080
// * FFD59E   525E75   D06224
// ! btn 002FFF 548CFF F1DDBF
}