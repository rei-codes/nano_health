import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nano_health/features/home/models/product.dart';

class RatingSection extends StatelessWidget {
  const RatingSection(this.rating, {super.key});
  final Rating rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reviews (${rating.count})',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.35,
              color: Color(0xFF444B51),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const SizedBox(width: 16),
              Text(
                '${rating.rate}',
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 24),
              IgnorePointer(
                child: RatingBar.builder(
                  initialRating: rating.rate,
                  allowHalfRating: true,
                  unratedColor: const Color(0xFFE4E4E4),
                  itemSize: 42,
                  itemBuilder: (_, __) => const Icon(
                    Icons.star_rounded,
                    color: Color(0xFFFFE072),
                  ),
                  onRatingUpdate: (_) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
