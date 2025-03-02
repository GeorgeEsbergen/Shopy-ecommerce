class Favourite {
  String? id;
  String? userId;
  DateTime? createdAt;
  String? productId;
  bool? isFavourite;

  Favourite({
    this.id,
    this.userId,
    this.createdAt,
    this.productId,
    this.isFavourite,
  });

  factory Favourite.fromJson(Map<String, dynamic> json) => Favourite(
        id: json['id'] as String?,
        userId: json['user_id'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        productId: json['product_id'] as String?,
        isFavourite: json['is_favourite'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'created_at': createdAt?.toIso8601String(),
        'product_id': productId,
        'is_favourite': isFavourite,
      };
}
