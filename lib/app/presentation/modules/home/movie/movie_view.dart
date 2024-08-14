import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/repositories_implementation/movie_repository_impl.dart';
import '../../../global/widgets/request_failed.dart';
import 'controller/movie_controller.dart';
import 'controller/state/movie_state.dart';

class MovieView extends StatelessWidget {
  const MovieView({
    super.key,
    required this.movieId,
  });
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieController(
        MovieState.loading(),
        movieId: movieId,
        moviesRepository: context.read<MovieRepositoryImpl>(),
      )..init(),
      builder: (context, _) {
        final MovieController controller = context.watch(); //para escuchar los cambios de MovieController
        return Scaffold(
            appBar: AppBar(),
            body: controller.state.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
                ), 
              failed: () => RequestFailed(
                onRetry: () => controller.init(),
                ), 
              loaded: (movie) => const Center(
                child: Text('MOVIE'),
              )
              ),
            );
      },
    );
  }
}
