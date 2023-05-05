import 'package:flutter/material.dart';
import 'package:worldcup22db/widgets/match_result_widget.dart';
import 'package:worldcup22db/widgets/widgets.dart';

class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final matchResult =
        ModalRoute.of(context)?.settings.arguments as MatchResult;
    final size = MediaQuery.of(context).size;
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
            MatchResultWidget(
                goalA: matchResult.golesEquipoA,
                goalB: matchResult.golesEquipoB),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  Text(
                    matchResult.fase,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TeamShieldName(
                        teamName: matchResult.equipoA,
                      ),
                      MatchDate(date: matchResult.fechaPartido),
                      TeamShieldName(
                        teamName: matchResult.equipoB,
                      )
                    ],
                  ),
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
                          ...matchResult.listaGoleadoresA.map(
                            (e) => Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              width: size.width * 0.5 - 50,
                              child: Text(
                                e,
                                textAlign: TextAlign.start,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ...matchResult.listaGoleadoresB.map(
                            (e) => Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              width: size.width * 0.5 - 50,
                              child: Text(
                                e,
                                textAlign: TextAlign.end,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if (matchResult.penaltisEquipoA != null)
                    const Text(
                      'Resultado de penaltis',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (matchResult.penaltisEquipoA != null)
                    MatchResultWidget(
                        goalA: matchResult.penaltisEquipoA!,
                        goalB: matchResult.penaltisEquipoB!),
                ],
              ),
            )
          ],
        ),
      ),
    )));
  }
}
