// import 'package:flutter/material.dart';
// import 'package:newproject/presentation/Auth/login.dart';

// import '../../constants/widgets/mytextfield.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({super.key});

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _usernameController = TextEditingController();
//     TextEditingController _passwordController1 = TextEditingController();
//     TextEditingController _passwordController2 = TextEditingController();
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 50, bottom: 25),
//               child: Icon(Icons.lock_open, size: 150),
//             ),
//             MyTextField(
//               HintText: 'Username',
//               LabelText: Text('Username'),
//               ObscureText: false,
//               controller: _usernameController,
//             ),
//             MyTextField(
//               HintText: 'Password',
//               LabelText: Text('Password'),
//               ObscureText: true,
//               controller: _passwordController1,
//             ),
//             MyTextField(
//               HintText: 'Confirm Password',
//               LabelText: Text('Confirm Password'),
//               ObscureText: true,
//               controller: _passwordController2,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 width: double.infinity,
//                 height: 60,
//                 child: Center(
//                   child: Text(
//                     'Login',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(10)),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context)
//                         .push(MaterialPageRoute(builder: (context) => LogIn()));
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15),
//                     child: Text(
//                       'Already have account',
//                       style: TextStyle(color: Colors.blue.shade700),
//                     ),
//                   ),
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(left: 30),
//                 //   child: Text(
//                 //     'Forgot password?',
//                 //     style: TextStyle(color: Colors.grey.shade500),
//                 //   ),
//                 // ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
