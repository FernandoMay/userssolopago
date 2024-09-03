import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

List<User> usersFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String usersToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class User {
    DateTime createdAt;
    String name;
    String avatar;
    String id;

    User({
        required this.createdAt,
        required this.name,
        required this.avatar,
        required this.id,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "id": id,
    };
}