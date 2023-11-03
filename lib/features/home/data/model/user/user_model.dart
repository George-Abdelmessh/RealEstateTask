class UserModel {
  int? id;
  String? name;
  String? username;

  UserModel({
    this.id,
    this.name,
    this.username,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }
}
