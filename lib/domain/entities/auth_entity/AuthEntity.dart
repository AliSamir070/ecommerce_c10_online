import 'UserEntity.dart';

/// message : "success"
/// user : {"name":"Mohamed Ahmed","email":"moha07000@gmail.com"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MjU2MDI0MzIwNTE2MDI3Nzg4YzAzYiIsIm5hbWUiOiJNb2hhbWVkIEFobWVkIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MTM3MjU0NzcsImV4cCI6MTcyMTUwMTQ3N30.D4-jjP8oZL779cyS-Htigi_5ztysbL2dIGpcgHXmt0E"

class AuthEntity {
  AuthEntity({
      this.message, 
      this.user, 
      this.token,});

  String? message;
  UserEntity? user;
  String? token;


}