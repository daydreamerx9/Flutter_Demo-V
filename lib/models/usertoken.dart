// To parse this JSON data, do
//
//     final usertoken = usertokenFromJson(jsonString);

import 'dart:convert';

Usertoken usertokenFromJson(String str) => Usertoken.fromJson(json.decode(str));

String usertokenToJson(Usertoken data) => json.encode(data.toJson());

class Usertoken {
    String accessToken;
    int remindIn;
    int expiresIn;

    Usertoken({
        this.accessToken,
        this.remindIn,
        this.expiresIn,
    });

    factory Usertoken.fromJson(Map<String, dynamic> json) => Usertoken(
        accessToken: json["access_token"],
        remindIn: json["remind_in"],
        expiresIn: json["expires_in"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "remind_in": remindIn,
        "expires_in": expiresIn,
    };
}
