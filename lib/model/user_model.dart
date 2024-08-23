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

  set setPoin(int addedPoin) {
    poin = poin! + addedPoin;
  }

  Map<String, Object?> toJson() => {
        "name": name,
        "user_name": userName,
        "exp": exp,
        "poin": poin,
        "badge": badge
      };

  factory UserModel.fromJson(Map<String?, Object?> json) => UserModel(
        userName: json["user_name"] as String?,
        name: json["name"] as String?,
        exp: json["exp"] as int?,
        poin: json["poin"] as int?,
        badge: json["badge"] as String?,
      );
}
