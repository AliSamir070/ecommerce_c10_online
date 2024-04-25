import 'package:ecommerce_c10_online/domain/entities/auth_entity/AuthEntity.dart';

import 'UserModel.dart';

/// message : "success"
/// statusMsg : ""
/// user : {"name":"Mohamed Ahmed","email":"moha0700@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MjU1Y2E4MzIwNTE2MDI3Nzg4YmViNiIsIm5hbWUiOiJNb2hhbWVkIEFobWVkIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MTM3MjQ1ODUsImV4cCI6MTcyMTUwMDU4NX0.ReOVUICPEBrXQ1--AONdZS8P5EU9J_obRdZvS0B3Lmo"

class AuthResponse {
  AuthResponse({
      this.message, 
      this.statusMsg, 
      this.user, 
      this.token,});

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  String? statusMsg;
  UserModel? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthEntity toAuthEntity(){
    return AuthEntity(
      user: user?.toUserEntity(),
      message: message,
      token: token
    );
  }

}