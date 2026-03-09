
import 'package:swifly_app/domain/entities/review_entity.dart';

class ProductEntity {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String image;
  final double rating;
  final double discountPercentage;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.image,
    required this.rating,
    required this.discountPercentage,
    required this.reviews
  });


}


