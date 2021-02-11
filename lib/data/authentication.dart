import 'dart:convert';
import 'package:flutter_educational_app/src/urls.dart';
import 'package:http/http.dart' as http;

class Authentication {
  Future<String> getCurrentState(String email) async {
    String response;
    try {
      final currentState = await http.post(currentStateURL, body: {
        "mobileNumber": '$email',
      });
      response = json.decode(currentState.body);
      return response;
    } catch (e) {
      print("ERROR FROM( getCurrentState ){ ${e.toString()} }");
      return "ERROR";
    }
  }

  Future<String> signIn(String device, String email, String password) async {
    try {
      String response;
      final signIn = await http.post(signInURL, body: {
        "mobileNumber": '$email',
        "date": '${DateTime.now()}',
        "deviceInfo": '$device',
        "password": '$password'
      });
      response = json.decode(signIn.body);
      return response;
    } catch (e) {
      print("ERROR FROM( signIn ){ ${e.toString()} }");
      return "ERROR";
    }
  }

  Future<String> signUp(String device, String email, String password) async {
    try {
      String response;
      final signUp = await http.post(signUpURL, body: {
        "mobileNumber": '$email',
        "date": '${DateTime.now()}',
        "deviceInfo": '$device',
        "password": '$password'
      });

      response = json.decode(signUp.body);
      return response;
    } catch (e) {
      print("ERROR FROM( signUp ){ ${e.toString()} }");
      return "ERROR";
    }
  }
}
