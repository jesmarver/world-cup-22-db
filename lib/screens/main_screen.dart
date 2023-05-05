import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worldcup22db/services/match_service.dart';
import 'package:worldcup22db/widgets/match_result_widget.dart';

import '../delegates/search_match_delegate.dart';
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
                        itemBuilder: (context, index) {
                          if (index == matchService.matches.length - 1) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 200),
                              child: FadeInLeft(
                                  child: MatchCard(
                                matchResult: matchService.matches[index],
                              )),
                            );
                          }
                          return FadeInLeft(
                              child: MatchCard(
                            matchResult: matchService.matches[index],
                          ));
                        },
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
            onPressed: () {
              Provider.of<MatchService>(context, listen: false).sort();
            },
            icon: const Icon(
              Icons.sort,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () async {
              final result = await showSearch(
                  context: context, delegate: SearchMatchDelegate());
            },
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
