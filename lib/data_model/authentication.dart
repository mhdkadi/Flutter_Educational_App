import 'package:device_info/device_info.dart';
import 'package:flutter_educational_app/data/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationModel {
  final Authentication auth = new Authentication();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<String> getCurrentState() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String sharedNumber = preferences.getString('email');
    String currentState = await auth.getCurrentState(sharedNumber);
    if (currentState == 'LogedIn') {
      return "HomeScreen";
    } else if (currentState == 'LogedOut' || currentState == 'NotFound') {
      return "SignInScreen";
    } else if (currentState == 'Blocked') {
      return "BlockedScreen";
    } else if (currentState == 'Wrong Passord') {
      return "Wrong Passord";
    } else {
      return "NoConnectionScreen";
    }
  }

  Future<String> signIn(String email, String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    String device = androidDeviceInfo.model.toString();
    String authenticate = await auth.signIn(device, email, password);
    if (authenticate == 'SignIn Successfully') {
      preferences.setString('email', "$email");
      return "SignIn Successfully";
    } else if (authenticate == 'Wrong Password') {
      return "Wrong Password";
    } else if (authenticate == 'Not Found') {
      return "Not Found";
    } else if (authenticate == 'Blocked') {
      return "Blocked";
    } else {
      return "ERROR";
    }
  }

  Future<String> signUp(String email, String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    String device = androidDeviceInfo.model.toString();
    String authenticate = await auth.signUp(device, email, password);
    if (authenticate == 'SignUp Successfully') {
      preferences.setString('email', "$email");
      return "SignUp Successfully";
    } else if (authenticate == 'Already Exists') {
      return "Already Exists";
    } else if (authenticate == 'Blocked') {
      return "Blocked";
    } else {
      return "ERROR";
    }
  }
}
