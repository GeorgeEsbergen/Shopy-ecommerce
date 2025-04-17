class RatesModel {
  String? id;
  DateTime? createdAt;
  int? rate;
  String? userId;
  String? productId;

  RatesModel({
    this.id,
    this.createdAt,
    this.rate,
    this.userId,
    this.productId,
  });

  factory RatesModel.fromJson(Map<String, dynamic> json) => RatesModel(
        id: json['id'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        rate: json['rate'] as int?,
        userId: json['user_id'] as String?,
        productId: json['product_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'rate': rate,
        'user_id': userId,
        'product_id': productId,
      };
}
