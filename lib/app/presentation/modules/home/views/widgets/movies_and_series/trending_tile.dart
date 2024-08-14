import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../domain/models/media/media.dart';
import '../../../../../global/utils/get_image_url.dart';
import '../../../../../routes/routes.dart';

class TrendingTile extends StatelessWidget {
  const TrendingTile({
    super.key, 
    required this.media, 
    required this.width,
    this.showData = true,
    });

  final Media media;
  final double width;
  final bool showData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(media.type == MediaType.movie){
          Navigator.pushNamed(
            context, 
            Routes.movie,
            arguments: media.id,
            );
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: width,
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                 imageUrl: getImageUrl(media.posterPath),
                  fit: BoxFit.cover,
                ),
              ),
              if(showData)
              Positioned(
                top: 5,
                right: 5,
                child: Opacity(
                  opacity: 0.7,
                  child: Column(
                    children: [
                      Chip(
                       // labelPadding: EdgeInsets.zero,
                        labelStyle: const TextStyle(fontSize: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        label: Text(media.voteAverage.toStringAsFixed(1)),
                      ),
                   const  SizedBox(height: 5), 
                      Chip(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    label: Icon(
                      media.type == MediaType.movie ? Icons.movie : Icons.tv,
                      size: 15,
                      ),
                    ),
                    ],
                  ),
                ),
              ),
              ],
          ),
        ),
      ),
    );
  }
}
