import 'package:flutter/material.dart';
import 'package:worldcup22db/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Worll Cup 22 DB',
        home: MainScreen());
  }
}
