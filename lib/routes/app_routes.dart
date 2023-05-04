import 'package:flutter/material.dart';
import 'package:worldcup22db/screens/screens.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    return {
      'main': (_) => const MainScreen(),
      'matchdetail': (_) => const MatchDetailScreen()
    };
  }
}
