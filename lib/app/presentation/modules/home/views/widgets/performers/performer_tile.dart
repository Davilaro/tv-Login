import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../domain/models/performer/performer.dart';
import '../../../../../global/utils/get_image_url.dart';
import '../movies_and_series/trending_tile.dart';

class PerfomerTile extends StatelessWidget {
  const PerfomerTile({super.key, required this.performer});

  final Performer performer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Positioned.fill(
                child: CachedNetworkImage(
              imageUrl: getImageUrl(performer.profilePath,
                  imageQuality: ImageQuality.original),
              fit: BoxFit.cover,
            )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(15).copyWith(bottom: 40),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      performer.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    //Widget Para mostrar las peliculas asociados al actor en el card actual
                    if (performer.knownFor.isNotEmpty)
                      SizedBox(
                        height: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: performer.knownFor.take(3).map(
                            (media) =>  TrendingTile(
                                media: media,
                                width: 130 * 0.75,
                                showData: false,
                              )
                            ).toList()
                        )
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
