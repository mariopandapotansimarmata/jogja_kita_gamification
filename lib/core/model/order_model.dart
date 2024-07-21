class OrderModel {
  final int? orderId;
  final String? userId;
  final String? dateTime;
  final int? amount;
  final int? isFinish;

  OrderModel(
      {this.orderId, this.userId, this.dateTime, this.amount, this.isFinish});

  Map<String, Object?> toJson() => {
        "order_id": orderId,
        "user_id": userId,
        "date_time": dateTime,
        "amount": amount,
        "is_finish": isFinish,
      };

  OrderModel copy(
          {int? orderId,
          String? userId,
          String? dateTime,
          int? amount,
          int? isFInish}) =>
      OrderModel(
        orderId: orderId ?? this.orderId,
        userId: userId ?? this.userId,
        dateTime: dateTime ?? this.dateTime,
        amount: amount ?? this.amount,
        isFinish: isFinish ?? this.isFinish,
      );

  factory OrderModel.fromJson(Map<String?, Object?> json) => OrderModel(
        orderId: json["order_id"] as int?,
        userId: json["user_id"] as String?,
        dateTime: json["date_time"] as String?,
        amount: json["amount"] as int?,
        isFinish: json["is_finish"] as int?,
      );
}
