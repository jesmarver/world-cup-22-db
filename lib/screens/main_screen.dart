import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            children: const [_Header(), _MatchCard()],
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
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(blurRadius: 4, spreadRadius: 0.5, color: Colors.black45)
          ]),
      child: const _MatchInfo(),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [_Team(), _MatchResult(), _Team()],
      ),
    );
  }
}

class _MatchResult extends StatelessWidget {
  const _MatchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tstyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
    return Container(
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '1',
            style: tstyle,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '-',
            style: tstyle,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '0',
            style: tstyle,
          ),
        ],
      ),
    );
  }
}

class _Team extends StatelessWidget {
  const _Team({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/betis.png',
            width: 60,
          ),
          Text(
            'Real Betis',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
        children: const [
          Text(
            'Resultados',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(
            Icons.sort,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.language,
            size: 30,
          )
        ],
      ),
    );
  }
}
