class OrderModel {
  final int? orderId;
  final String? userName;
  final String? dateTime;
  final String? orderName;
  final String? orderCategory;
  final int? amount;
  int? isFinish;

  OrderModel({
    this.orderId,
    this.userName,
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
        "user_name": userName,
        "date_time": dateTime,
        "order_name": orderName,
        "order_category": orderCategory,
        "amount": amount,
        "is_finish": isFinish,
      };

  OrderModel copy(
          {int? orderId,
          String? userName,
          String? dateTime,
          String? orderName,
          String? orderCategory,
          int? amount,
          int? isFInish}) =>
      OrderModel(
        orderId: orderId ?? this.orderId,
        userName: userName ?? this.userName,
        dateTime: dateTime ?? this.dateTime,
        orderName: orderName ?? this.orderName,
        orderCategory: orderCategory ?? this.orderCategory,
        amount: amount ?? this.amount,
        isFinish: isFinish ?? isFinish,
      );

  factory OrderModel.fromJson(Map<String?, Object?> json) => OrderModel(
        orderId: json["order_id"] as int?,
        userName: json["user_name"] as String?,
        dateTime: json["date_time"] as String?,
        orderName: json["order_name"] as String?,
        orderCategory: json["order_category"] as String?,
        amount: json["amount"] as int?,
        isFinish: json["is_finish"] as int?,
      );
}
