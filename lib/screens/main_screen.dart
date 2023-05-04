import 'package:flutter/material.dart';
import 'package:worldcup22db/widgets/match_result_widget.dart';

import '../widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: size.height),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => const _MatchCard(),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class _MatchCard extends StatelessWidget {
  const _MatchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'matchdetail'),
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
        child: const _MatchInfo(),
      ),
    );
  }
}

class _MatchInfo extends StatelessWidget {
  const _MatchInfo({
    super.key,
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
            children: const [
              TeamShield(),
              MatchResultWidget(
                goalA: 2,
                goalB: 0,
              ),
              TeamShield()
            ],
          ),
          const TeamNames(
            teamA: 'Real Betis',
            teamB: 'Sevilla FC',
          ),
          const MatchDate(
            date: '20-11-2022',
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
