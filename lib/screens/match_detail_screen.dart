import 'package:flutter/material.dart';
import 'package:worldcup22db/widgets/widgets.dart';

class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> golesA = ["21' Manolo", "32' Juan"];
    List<String> golesB = ["13' Pablo"];
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.chevron_left_outlined,
                      size: 40,
                    )),
                const Text(
                  'Detalles del partido',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  const Text('Fecha 1'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      TeamShield(),
                      MatchDate(date: '10-05-2023'),
                      TeamShield()
                    ],
                  ),
                  const TeamNames(teamA: 'Real Betis', teamB: 'Sevilla FC'),
                  const Divider(
                    thickness: 4,
                    height: 50,
                    color: Colors.black,
                  ),
                  const Text(
                    'Goleadores',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...golesA.map(
                            (e) => Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                e,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ...golesB.map(
                            (e) => Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                e,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    )));
  }
}
