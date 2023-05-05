import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worldcup22db/services/match_service.dart';
import 'package:worldcup22db/widgets/match_result_widget.dart';

import '../widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final matchService = Provider.of<MatchService>(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            children: [
              const _Header(),
              FutureBuilder(
                  future: matchService.getItems(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data == false) {
                      return Column(
                        children: const [
                          SizedBox(
                            height: 20,
                          ),
                          Text('Cargando resultados'),
                          SizedBox(
                            height: 20,
                          ),
                          CircularProgressIndicator(),
                        ],
                      );
                    }
                    return ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: size.height),
                      child: ListView.builder(
                        itemCount: matchService.matches.length,
                        itemBuilder: (context, index) => FadeInLeft(
                            child: _MatchCard(
                          matchResult: matchService.matches[index],
                        )),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    ));
  }
}

class _MatchCard extends StatelessWidget {
  final MatchResult matchResult;
  const _MatchCard({
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
                imagePath: 'assets/betis.png',
              ),
              MatchResultWidget(
                goalA: matchResult.golesEquipoA,
                goalB: matchResult.golesEquipoB,
              ),
              TeamShieldName(
                teamName: matchResult.equipoB,
                imagePath: 'assets/betis.png',
              )
            ],
          ),
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

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const Text(
            'Resultados',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.sort,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.language,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
