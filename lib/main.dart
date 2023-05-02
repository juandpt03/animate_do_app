import 'package:flutter/material.dart';
import 'package:animate_do_app/presentation/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: Colors.greenAccent,
          useMaterial3: true,
          brightness: Brightness.dark),
      title: 'Animate_do',
      home: const Screen1(),
    );
  }
}
