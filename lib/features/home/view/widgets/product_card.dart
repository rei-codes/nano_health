import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/product.dart';
import '../pages/details_page.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.item, {super.key});
  final Product item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => DetailsPage(item.id)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Image.network(
                  item.image,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 65,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(.30),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${item.price} AED',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    IgnorePointer(
                      child: RatingBar.builder(
                        initialRating: item.rating.rate,
                        allowHalfRating: true,
                        unratedColor: const Color(0xFFE4E4E4),
                        itemSize: 32,
                        itemBuilder: (_, __) => const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFE072),
                        ),
                        onRatingUpdate: (_) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 12),
          Text(
            item.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
