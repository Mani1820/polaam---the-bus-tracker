import 'package:flutter/material.dart';
import 'package:polam/core/constants/app_colors.dart';
import 'package:polam/core/constants/app_textfield.dart';
import 'package:polam/core/constants/main_button.dart';
import 'package:polam/features/auth/views/login_screen.dart';
import 'package:polam/features/home/views/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> _signUpWithEmailAndPassword() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('The password provided is too weak.'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (FirebaseAuth.instance.currentUser != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('The account already exists for that email.'),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message ?? 'An error occurred'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Create Account",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontFamily: 'SF Pro Display',
              ),
            ),
            SizedBox(height: size.height * 0.07),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextfield(
                    text: 'Email',
                    controller: emailController,
                  ),
                  SizedBox(height: size.height * 0.02),
                  AppTextfield(
                    text: 'Phone',
                    controller: phoneController,
                  ),
                  SizedBox(height: size.height * 0.02),
                  AppTextfield(
                      text: 'Password',
                      controller: passwordController,
                      obscuredText: true),
                  SizedBox(height: size.height * 0.02),
                  AppTextfield(
                      text: 'Confirm Password',
                      controller: confirmPasswordController,
                      obscuredText: true),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontFamily: 'SF Pro Display',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (ctx) => const LoginScreen(),
                        ),
                        (_) => false);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryBlue,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            MainButton(
              text: 'Sign Up',
              onPressed: () async {
                await _signUpWithEmailAndPassword();
                if (mounted) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (ctx) => const HomeScreen(),
                      ),
                      (_) => false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
