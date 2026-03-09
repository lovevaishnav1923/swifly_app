
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/review_entity.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rating;
  final double discountPercentage;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final double weight;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<ReviewModel> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.discountPercentage,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] ?? '',
      price: (json['price'] as num).toDouble(),
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      image: json['thumbnail'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      tags: List<String>.from(json['tags'] ?? []),
      brand: json['brand'] ?? '',
      sku: json['sku'] ?? '',
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      warrantyInformation: json['warrantyInformation'] ?? '',
      shippingInformation: json['shippingInformation'] ?? '',
      availabilityStatus: json['availabilityStatus'] ?? '',
      reviews: (json['reviews'] as List? ?? [])
          .map((e) => ReviewModel.fromJson(e))
          .toList(),
      returnPolicy: json['returnPolicy'] ?? '',
      minimumOrderQuantity:
          (json['minimumOrderQuantity'] as num?)?.toInt() ?? 0,
      images: List<String>.from(json['images'] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
    'stock': stock,
    'tags': tags,
    'brand': brand,
    'sku': sku,
    'weight': weight,
    'warrantyInformation': warrantyInformation,
    'shippingInformation': shippingInformation,
    'availabilityStatus': availabilityStatus,
    'reviews': reviews.map((e) => e.toJson()).toList(),
    'returnPolicy': returnPolicy,
    'minimumOrderQuantity': minimumOrderQuantity,
    'images': images,
  };

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: rating,
      discountPercentage: discountPercentage,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }
}

class ReviewModel {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  ReviewModel({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    rating: (json['rating'] as num?)?.toInt() ?? 0,
    comment: json['comment'] ?? '',
    date: json['date'] ?? '',
    reviewerName: json['reviewerName'] ?? '',
    reviewerEmail: json['reviewerEmail'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'rating': rating,
    'comment': comment,
    'date': date,
    'reviewerName': reviewerName,
    'reviewerEmail': reviewerEmail,
  };

  ReviewEntity toEntity() {
    return ReviewEntity(
      rating: rating,
      comment: comment,
      date: date,
      reviewerName: reviewerName,
      reviewerEmail: reviewerEmail,
    );
  }
}
