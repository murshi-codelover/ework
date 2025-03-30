import 'package:flutter/material.dart';
import 'package:newproject/presentation/Auth/login.dart';

import '../../constants/widgets/mytextfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController1.dispose();
    _passwordController2.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_passwordController1.text == _passwordController2.text) {
      // Implement signup logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signup Successful!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, bottom: 25),
              child: Icon(Icons.lock_open, size: 150),
            ),
            MyTextField(
              HintText: 'Username',
              LabelText: const Text('Username'),
              ObscureText: false,
              controller: _usernameController,
              suffixIcon: IconButton(
                  icon: Icon(Icons.person_add_alt_1), onPressed: () {}),
            ),
            MyTextField(
              HintText: 'Password',
              LabelText: const Text('Password'),
              ObscureText: true,
              controller: _passwordController1,
              suffixIcon: IconButton(
                  icon: Icon(Icons.person_add_alt_1), onPressed: () {}),
            ),
            MyTextField(
              HintText: 'Confirm Password',
              LabelText: const Text('Confirm Password'),
              ObscureText: true,
              controller: _passwordController2,
              suffixIcon: IconButton(
                  icon: Icon(Icons.person_add_alt_1), onPressed: () {}),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: _signUp,
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LogIn()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Already have an account? Log in',
                      style: TextStyle(color: Colors.blue.shade700),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
