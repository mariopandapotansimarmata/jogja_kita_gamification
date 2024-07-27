class UserModel {
  final String? userName;
  final String? name;
  int? exp;
  int? poin;
  String? badge;

  UserModel(
      {this.name, this.userName, this.exp = 0, this.poin = 0, this.badge});

  set setExp(int addExp) {
    exp = exp! + addExp;
  }

  set setBadge(String newBadge) {
    badge = newBadge;
  }

  Map<String, Object?> toJson() => {
        "name": name,
        "user_name": userName,
        "exp": exp,
        "poin": poin,
        "badge": badge
      };

  UserModel copy(
          {String? userName,
          String? name,
          int? exp,
          int? poin,
          String? badge}) =>
      UserModel(
          userName: userName ?? this.userName,
          name: name ?? this.name,
          exp: exp ?? 0,
          poin: poin ?? 0,
          badge: badge ?? "Amateur");

  factory UserModel.fromJson(Map<String?, Object?> json) => UserModel(
        userName: json["user_name"] as String?,
        name: json["name"] as String?,
        exp: json["exp"] as int?,
        poin: json["poin"] as int?,
        badge: json["badge"] as String?,
      );
}
