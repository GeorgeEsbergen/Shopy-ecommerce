class Purchase {
  String? id;
  String? userId;
  DateTime? createdAt;
  String? productId;
  bool? isPurchased;

  Purchase({
    this.id,
    this.userId,
    this.createdAt,
    this.productId,
    this.isPurchased,
  });

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
        id: json['id'] as String?,
        userId: json['user_id'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        productId: json['product_id'] as String?,
        isPurchased: json['is_purchased'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'created_at': createdAt?.toIso8601String(),
        'product_id': productId,
        'is_purchased': isPurchased,
      };
}
