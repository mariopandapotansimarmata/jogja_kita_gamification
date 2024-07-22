class OrderModel {
  final int? orderId;
  final String? userId;
  final String? dateTime;
  final String? orderName;
  final String? orderCategory;
  final int? amount;
  int? isFinish;

  OrderModel({
    this.orderId,
    this.userId,
    this.dateTime,
    this.amount,
    this.orderName,
    this.orderCategory,
    this.isFinish,
  });

  set setIsFinish(int? status) {
    isFinish = status;
  }

  Map<String, Object?> toJson() => {
        "order_id": orderId,
        "user_id": userId,
        "date_time": dateTime,
        "order_name": orderName,
        "order_category": orderCategory,
        "amount": amount,
        "is_finish": isFinish,
      };

  OrderModel copy(
          {int? orderId,
          String? userId,
          String? dateTime,
          String? orderName,
          String? orderCategory,
          int? amount,
          int? isFInish}) =>
      OrderModel(
        orderId: orderId ?? this.orderId,
        userId: userId ?? this.userId,
        dateTime: dateTime ?? this.dateTime,
        orderName: orderName ?? this.orderName,
        orderCategory: orderCategory ?? this.orderCategory,
        amount: amount ?? this.amount,
        isFinish: isFinish ?? this.isFinish,
      );

  factory OrderModel.fromJson(Map<String?, Object?> json) => OrderModel(
        orderId: json["order_id"] as int?,
        userId: json["user_id"] as String?,
        dateTime: json["date_time"] as String?,
        orderName: json["order_name"] as String?,
        orderCategory: json["order_category"] as String?,
        amount: json["amount"] as int?,
        isFinish: json["is_finish"] as int?,
      );
}
