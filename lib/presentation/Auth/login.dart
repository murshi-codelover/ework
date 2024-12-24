import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import '../mobilescreens/adminscreen/screens/homescreen.dart';
import '../mobilescreens/userscreen/screens/homescreen.dart';

// ignore: must_be_immutable
class LogIn extends StatelessWidget {
  LogIn({super.key});

  final Duration loadingTime = const Duration(milliseconds: 200);
  String? loggedInEmail; // Variable to store the email during login

  Future<String?> _authUser(LoginData data) async {
    await Future.delayed(loadingTime); // Simulate a delay
    if (data.name == "murshidiqbaalkm@gmail.com" ||
        data.name == "murshidiqbalkm10@gmail.com") {
      loggedInEmail = data.name; // Save the email for later use
      return null; // Successful login
    } else if (data.name.isNotEmpty) {
      loggedInEmail = data.name; // Save the email for later use
      return null; // Successful login
    }
    return 'Invalid email address'; // Show error for empty or invalid email
  }

  Future<String?> _recoverPassword(String data) {
    return Future.delayed(loadingTime).then((value) => null);
  }

  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loadingTime).then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        onLogin: _authUser,
        onRecoverPassword: _recoverPassword,
        onSignup: _signupUser,
        onSubmitAnimationCompleted: () {
          // Navigate to different screens based on the logged-in email
          if (loggedInEmail == "murshidiqbaalkm@gmail.com") {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Homescreen()),
            );
          }
        },
      ),
    );
  }
}
