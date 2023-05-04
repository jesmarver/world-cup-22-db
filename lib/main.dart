import 'package:flutter/material.dart';
import 'package:worldcup22db/routes/app_routes.dart';
import 'package:worldcup22db/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Worll Cup 22 DB',
      routes: AppRoutes.getAppRoutes(),
      initialRoute: 'main',
    );
  }
}
