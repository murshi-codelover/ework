import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import '../mobilescreens/adminscreen/screens/homescreen.dart';
import '../mobilescreens/userscreen/screens/homescreen.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final Duration loadingTime = const Duration(milliseconds: 200);
  String? loggedInEmail; // Stores the email during login

  Future<String?> _authUser(LoginData data) async {
    await Future.delayed(loadingTime); // Simulate a delay

    setState(() {
      loggedInEmail = data.name;
    });

    if (data.name == "murshidiqbaalkm@gmail.com" ||
        data.name == "murshidiqbalkm10@gmail.com") {
      return null; // Successful login for admin
    } else if (data.name.isNotEmpty) {
      return null; // Successful login for users
    }
    return 'Invalid email address'; // Show error for empty or invalid email
  }

  Future<String?> _recoverPassword(String data) async {
    await Future.delayed(loadingTime);
    return null;
  }

  Future<String?> _signupUser(SignupData data) async {
    await Future.delayed(loadingTime);
    return null;
  }

  void _navigateToHome() {
    if (loggedInEmail == "murshidiqbaalkm@gmail.com") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Homescreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        onLogin: _authUser,
        onRecoverPassword: _recoverPassword,
        onSignup: _signupUser,
        onSubmitAnimationCompleted: _navigateToHome,
      ),
    );
  }
}
