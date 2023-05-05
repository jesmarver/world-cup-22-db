import 'package:flutter/material.dart';

import '../models/models.dart';
import 'widgets.dart';

class MatchCard extends StatelessWidget {
  final MatchResult matchResult;
  const MatchCard({
    super.key,
    required this.matchResult,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, 'matchdetail', arguments: matchResult),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(blurRadius: 4, spreadRadius: 0.5, color: Colors.black45)
            ]),
        child: _MatchInfo(
          matchResult: matchResult,
        ),
      ),
    );
  }
}

class _MatchInfo extends StatelessWidget {
  final MatchResult matchResult;

  const _MatchInfo({
    super.key,
    required this.matchResult,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TeamShieldName(
                teamName: matchResult.equipoA,
              ),
              Hero(
                tag:
                    '${matchResult.equipoA}-${matchResult.equipoB}-${matchResult.fechaPartido}',
                child: MatchResultWidget(
                  goalA: matchResult.golesEquipoA,
                  goalB: matchResult.golesEquipoB,
                ),
              ),
              TeamShieldName(
                teamName: matchResult.equipoB,
              )
            ],
          ),
          if (matchResult.penaltisEquipoA != null)
            Text(
                '${matchResult.penaltisEquipoA} - ${matchResult.penaltisEquipoB}'),
          // TeamNames(
          //   teamA: matchResult.equipoA,
          //   teamB: matchResult.equipoB,
          // ),
          MatchDate(
            date: matchResult.fechaPartido,
          )
        ],
      ),
    );
  }
}
