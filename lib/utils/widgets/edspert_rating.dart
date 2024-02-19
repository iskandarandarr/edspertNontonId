import 'package:edspert_final_project/utils/edspert_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class EdspertRating {
  static Widget rating({required double initialRating, double itemSize = 10}) {
    return RatingBar(
      initialRating: initialRating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: itemSize,
      minRating: 1,
      ignoreGestures: true,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star,
          color: EdspertColor.yellow,
        ),
        half: const Icon(
          Icons.star,
          color: EdspertColor.yellow,
        ),
        empty: const Icon(
          Icons.star_border_outlined,
          color: EdspertColor.yellow,
        ),
      ),
      itemPadding: const EdgeInsets.symmetric(horizontal: 1),
      onRatingUpdate: (rating) {},
    );
  }
}
