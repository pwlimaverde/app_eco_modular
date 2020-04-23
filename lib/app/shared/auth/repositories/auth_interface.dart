import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository{
  Future<FirebaseUser> getUser();
  Future<FirebaseUser> getGoogleLogin();
  Future<FirebaseUser> getEmailLogin();
  Future<String> getToken();
  Future getLogout();
}