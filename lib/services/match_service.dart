import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class MatchService extends ChangeNotifier {
  final String _baseUrl = 'worldcup22db-default-rtdb.firebaseio.com';
  List<MatchResult> _matches = [];

  List<MatchResult> get matches => _matches;
  bool sorted = true;

  set matches(List<MatchResult> val) {
    _matches = val;
    notifyListeners();
  }

  void sort() {
    _matches.sort((a, b) {
      final splitDateA = a.fechaPartido.split('-');
      final dateAstr = splitDateA[2] + splitDateA[1] + splitDateA[0];
      final splitDateB = b.fechaPartido.split('-');
      final dateBstr = splitDateB[2] + splitDateB[1] + splitDateB[0];
      final dateA = DateTime.parse(dateAstr);
      final dateB = DateTime.parse(dateBstr);
      return sorted ? dateB.compareTo(dateA) : dateA.compareTo(dateB);
    });
    sorted = !sorted;
    notifyListeners();
  }

  List<MatchResult> findByName(String name) {
    return matches
        .where((element) =>
            element.equipoA
                .trim()
                .toLowerCase()
                .contains(name.trim().toLowerCase()) ||
            element.equipoB
                .trim()
                .toLowerCase()
                .contains(name.trim().toLowerCase()))
        .toList();
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
