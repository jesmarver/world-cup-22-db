import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class MatchService extends ChangeNotifier {
  final String _baseUrl = 'worldcup22db-default-rtdb.firebaseio.com';
  List<MatchResult> _matches = [];

  List<MatchResult> get matches => _matches;

  set matches(List<MatchResult> val) {
    _matches = val;
    notifyListeners();
  }

  Future<bool> getItems() async {
    if (matches.isNotEmpty) return true;
    final url = Uri.https(_baseUrl, 'Matches.json');

    try {
      final resp = await http.get(url);

      List<dynamic> rawdata = jsonDecode(resp.body);

      List<MatchResult> aux = [];

      rawdata.forEach((element) {
        final matchResult = MatchResult.fromJson(element);
        aux.add(matchResult);
      });

      matches = aux;
      return true;
    } catch (e) {
      print('Error al obtener los datos: $e');
      return false;
    }
  }
}
