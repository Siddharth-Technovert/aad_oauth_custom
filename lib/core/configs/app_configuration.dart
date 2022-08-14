import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppConfiguration {
  //TODO: Add your base url here
  static const baseUrl = "";

  //TODO google client id "<ADD YOUR CLIENT ID>"
  static GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'],
    clientId: "<ADD YOUR CLIENT ID>",
  );

  //TODO IMPLEMENT CONFIGURATIONS ON FACEBOOK DEVELOPER WEBSITE
  static FacebookAuth facebookLogin = FacebookAuth.instance;

  static const EventChannel eventChannel =
      EventChannel('com.technovert.boilerplate/eventChannel');
  static const MethodChannel methodChannel =
      MethodChannel("com.technovert.boilerplate/methodChannel");
}
