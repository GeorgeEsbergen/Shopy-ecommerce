import 'favourite.dart';
import 'purchase.dart';

class ProductModel {
  String? id;
  DateTime? createdAt;
  String? name;
  String? price;
  String? oldPrice;
  String? sale;
  String? description;
  String? category;
  List<Favourite>? favourites;
  List<Purchase>? purchase;

  ProductModel({
    this.id,
    this.createdAt,
    this.name,
    this.price,
    this.oldPrice,
    this.sale,
    this.description,
    this.category,
    this.favourites,
    this.purchase,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        name: json['name'] as String?,
        price: json['price'] as String?,
        oldPrice: json['old_price'] as String?,
        sale: json['sale'] as String?,
        description: json['description'] as String?,
        category: json['category'] as String?,
        favourites: (json['favourites'] as List<dynamic>?)
            ?.map((e) => Favourite.fromJson(e as Map<String, dynamic>))
            .toList(),
        purchase: (json['purchase'] as List<dynamic>?)
            ?.map((e) => Purchase.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'name': name,
        'price': price,
        'old_price': oldPrice,
        'sale': sale,
        'description': description,
        'category': category,
        'favourites': favourites?.map((e) => e.toJson()).toList(),
        'purchase': purchase?.map((e) => e.toJson()).toList(),
      };
}
