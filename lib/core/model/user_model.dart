class UserModel {
  final int? userId;
  final String? name;
  final String? userName;
  int? exp;

  UserModel({this.userId, this.name, this.userName, this.exp = 0});

  set setExp(int addExp) {
    exp = exp! + addExp;
  }

  Map<String, Object?> toJson() =>
      {"user_id": userId, "name": name, "user_name": userName, "exp": exp};

  UserModel copy({int? userId, String? name, String? userName, int? exp}) =>
      UserModel(
          userId: userId ?? this.userId,
          name: name ?? this.name,
          userName: userName ?? this.userName,
          exp: exp ?? 0);

  factory UserModel.fromJson(Map<String?, Object?> json) => UserModel(
        userId: json["user_id"] as int?,
        name: json["name"] as String?,
        userName: json["user_name"] as String?,
        exp: json["exp"] as int?,
      );
}
