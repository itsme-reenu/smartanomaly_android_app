import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartanomaly_androidapp/UI/components/carousel.dart';
import 'package:get_it/get_it.dart';
import 'package:smartanomaly_androidapp/logic/authenticationservice.dart';
import 'package:smartanomaly_androidapp/logic/usermanagement_service.dart';

class LoginPage extends StatelessWidget {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  const LoginPage({Key? key}) : super(key: key);

  void _signIn() async {
    final email = emailController.text;
    final password = passwordController.text;
var userManagementService = GetIt.instance<UserManagementService>();
 userManagementService.signInWithEmailAndPassword(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(249, 102, 22, 102),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: ImageCarousel(),
            ),
            Center(child: _buildForm(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width * 0.7;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Center(
              child: Text(
                'WELCOME !! Let\'s Sign You In',
                style: GoogleFonts.teko(
                  color: const Color.fromARGB(255, 45, 10, 51),
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    const Shadow(
                      blurRadius: 10.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                      offset: const Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Center(
              child: Text(
                'Sign in for security, your digital shield awaits!',
                style: GoogleFonts.teko(
                  color: const Color.fromARGB(255, 45, 10, 51),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    const Shadow(
                      blurRadius: 8.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                      offset: const Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              width: 300, // Set the width as needed
              height: 50,
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                validator: (value) {
                  final emailRegex =
                      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                  if (value!.isEmpty) {
                    return 'Please enter an email address';
                  } else if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: 300,
              height: 50,
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: 100, // Set the width as needed
              height: 50, // Set the height as needed
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) _signIn();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 20,
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Open Sans SemiBold',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
