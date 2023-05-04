// To parse this JSON data, do
//
//     final matchResult = matchResultFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class MatchResult {
  final String equipoA;
  final String equipoB;
  final dynamic golesEquipoA;
  final dynamic golesEquipoB;
  final String torneo;
  final String fase;
  final String? goleadoresEquipoB;
  final String fechaPartido;
  final String? goleadoresEquipoA;

  MatchResult({
    required this.equipoA,
    required this.equipoB,
    required this.golesEquipoA,
    required this.golesEquipoB,
    this.torneo = 'COPA MUNDIAL',
    required this.fase,
    required this.goleadoresEquipoB,
    required this.fechaPartido,
    required this.goleadoresEquipoA,
  });

  factory MatchResult.fromRawJson(String str) =>
      MatchResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MatchResult.fromJson(Map<String, dynamic> json) => MatchResult(
        equipoA: json["equipo_a"],
        equipoB: json["equipo_b"],
        golesEquipoA: json["goles_equipo_a"] ?? '',
        golesEquipoB: json["goles_equipo_b"] ?? '',
        fase: json["fase"],
        goleadoresEquipoB: json["goleadores_equipo_b"],
        fechaPartido: json["fecha_partido"],
        goleadoresEquipoA: json["goleadores_equipo_a"],
      );

  Map<String, dynamic> toJson() => {
        "equipo_a": equipoA,
        "equipo_b": equipoB,
        "goles_equipo_a": golesEquipoA,
        "goles_equipo_b": golesEquipoB,
        "fase": fase,
        "goleadores_equipo_b": goleadoresEquipoB,
        "fecha_partido": fechaPartido,
        "goleadores_equipo_a": goleadoresEquipoA,
      };
}
