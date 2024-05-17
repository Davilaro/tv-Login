import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../domain/either/either.dart';
import '../../../../../../domain/failures/sign_in/http_request/http_request_failure.dart';
import '../../../../../../domain/models/performer/performer.dart';
import '../../../../../../domain/repositories/trending_repository.dart';
import 'performer_tile.dart';

typedef EitherListPerformer = Either<HttpRequestFaliure, List<Performer>>;

class TrendingPerformers extends StatefulWidget {
  const TrendingPerformers({super.key});

  @override
  State<TrendingPerformers> createState() => _TrendingPerformersState();
}

class _TrendingPerformersState extends State<TrendingPerformers> {
  late Future<EitherListPerformer> _future;

  late PageController _pageController;
  //int _currentCard = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    //   _pageController.addListener(() {
    //     setState(() {
    //       _currentCard = _pageController.page!.toInt();
    //     });
    //   });
    _future = context.read<TrendingRepository>().getPerformers();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<EitherListPerformer>(
        future: _future,
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return snapshot.data!.when(
            left: (_) => const Text('Error'),
            right: (list) => Stack(
              alignment: Alignment.bottomCenter, 
              children: [
                PageView.builder(
                  controller: _pageController,
                  padEnds: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final performer = list[index];
                    return PerfomerTile(performer: performer);
                  },
                ),
                Positioned(
                  bottom: 20,
                  child: AnimatedBuilder(
                      animation: _pageController,
                      builder: (_, __) {
                        int currentCard = _pageController.page?.toInt() ?? 0;
                        return Row(
                          children: 
                            List.generate(
                              list.length, 
                            (index) =>  Icon(
                              size: 14,
                              Icons.circle,
                              color: currentCard == index
                              ? Colors.blue
                              :Colors.white30

                              )
                            )
                          
                        );
                      }),
                ),
                const SizedBox(height: 10)
              ],
            ),
          );
        },
      ),
    );
  }
}
