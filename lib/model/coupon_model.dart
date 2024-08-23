class CouponModel {
  final int? couponId;
  final String? userName;
  final String? couponName;
  final String? couponCategory;
  final int? discount;
  // final bool? isClaim;

  CouponModel({
    this.couponId,
    this.userName,
    this.couponName,
    this.couponCategory,
    this.discount,
    // this.isClaim,
  });

  Map<String, Object?> toJson() => {
        "coupon_id": couponId,
        "user_name": userName,
        "coupon_name": couponName,
        "coupon_category": couponCategory,
        "discount": discount,
        // "is_claim": isClaim
      };

  CouponModel copy({
    int? couponId,
    String? userName,
    String? couponName,
    String? couponCategory,
    int? discount,
    // bool? isClaim
  }) =>
      CouponModel(
        couponId: couponId ?? this.couponId,
        userName: userName ?? this.userName,
        couponName: couponName ?? this.couponName,
        couponCategory: couponCategory ?? this.couponCategory,
        discount: discount ?? this.discount,
        // isClaim: isClaim ?? this.isClaim
      );

  factory CouponModel.fromJson(Map<String?, Object?> json) => CouponModel(
        couponId: json["coupon_id"] as int?,
        userName: json["user_id"] as String?,
        couponName: json["coupon_name"] as String?,
        couponCategory: json["coupon_category"] as String?,
        discount: json["discount"] as int?,
        // isClaim: json["is_claim"] as bool?,
      );
}
