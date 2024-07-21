class CouponModel {
  final int? couponId;
  final String? userId;
  final String? couponName;
  final int? discount;
  final bool? isClaim;

  CouponModel({
    this.couponId,
    this.userId,
    this.couponName,
    this.discount,
    this.isClaim,
  });

  Map<String, Object?> toJson() => {
        "coupon_id": couponId,
        "user_id": userId,
        "coupon_name": couponName,
        "discount": discount,
        "is_claim": isClaim
      };

  CouponModel copy(
          {int? couponId,
          String? userId,
          String? couponName,
          int? discount,
          bool? isClaim}) =>
      CouponModel(
          couponId: couponId ?? this.couponId,
          userId: userId ?? this.userId,
          couponName: userId ?? this.userId,
          discount: discount ?? this.discount,
          isClaim: isClaim ?? this.isClaim);

  factory CouponModel.fromJson(Map<String?, Object?> json) => CouponModel(
        couponId: json["coupon_id"] as int?,
        userId: json["user_id"] as String?,
        couponName: json["coupon_name"] as String?,
        discount: json["discount"] as int?,
        isClaim: json["is_claim"] as bool?,
      );
}
