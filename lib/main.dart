import 'package:flutter/material.dart';
import 'Screens/initial_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TASK I',
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(color: Color(0xff0a0e21)),
          scaffoldBackgroundColor: const Color(0xff0a0e21)),
      home: const MyHomePage(title: 'USERS'),
    );
  }
}
