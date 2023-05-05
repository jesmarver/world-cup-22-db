// To parse this JSON data, do
//
//     final matchResult = matchResultFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class MatchResult {
  String equipoA;
  String equipoB;
  int golesEquipoA;
  int golesEquipoB;
  String fase;
  String? goleadoresEquipoB;
  String fechaPartido;
  String? goleadoresEquipoA;
  int? penaltisEquipoA;
  int? penaltisEquipoB;

  MatchResult({
    required this.equipoA,
    required this.equipoB,
    required this.golesEquipoA,
    required this.golesEquipoB,
    required this.fase,
    this.goleadoresEquipoB,
    required this.fechaPartido,
    this.goleadoresEquipoA,
    required this.penaltisEquipoA,
    required this.penaltisEquipoB,
  });

  List<String> get listaGoleadoresA {
    return goleadoresEquipoA?.split(';') ?? [];
  }

  List<String> get listaGoleadoresB {
    return goleadoresEquipoB?.split(';') ?? [];
  }

  factory MatchResult.fromRawJson(String str) =>
      MatchResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MatchResult.fromJson(Map<String, dynamic> json) => MatchResult(
        equipoA: json["equipo_a"],
        equipoB: json["equipo_b"],
        golesEquipoA: json["goles_equipo_a"],
        golesEquipoB: json["goles_equipo_b"],
        fase: json["fase"],
        goleadoresEquipoB: json["goleadores_equipo_b"] ?? '',
        fechaPartido: json["fecha_partido"],
        goleadoresEquipoA: json["goleadores_equipo_a"] ?? '',
        penaltisEquipoA: json["penaltis_equipo_a"],
        penaltisEquipoB: json["penaltis_equipo_b"],
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
        "penaltis_equipo_a": penaltisEquipoA,
        "penaltis_equipo_b": penaltisEquipoB,
      };
}
