import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:polam/core/constants/app_colors.dart';
import 'package:polam/core/constants/app_textfield.dart';
import 'package:polam/core/constants/main_button.dart';
import 'package:polam/features/auth/views/forgot_passord.dart';
import 'package:polam/features/auth/views/signup_screen.dart';
import 'package:polam/features/auth/widgets/social_media_container.dart';
import 'package:polam/features/home/views/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loginWithEmailAndPassword() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print(userCredential.user);
    } on FirebaseAuthException catch (e) {
      // Handle error here
      if (mounted) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('No user found for that email.'),
            backgroundColor: Colors.red,
          ));
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Wrong password provided for that user.'),
            backgroundColor: Colors.red,
          ));
        } else {
          // Handle other errors
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.message ?? 'An error occurred'),
            backgroundColor: Colors.red,
          ));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontFamily: 'SF Pro Display',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.1),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppTextfield(
                      text: 'Email',
                      controller: _emailController,
                    ),
                    SizedBox(height: size.height * 0.02),
                    AppTextfield(
                        text: 'Password',
                        controller: _passwordController,
                        obscuredText: true),
                    SizedBox(height: size.height * 0.02),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const ForgotPassord(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryBlue,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    MainButton(
                        text: 'Login',
                        onPressed: () async {
                          if (mounted) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (ctx) => const HomeScreen(),
                                ),
                                (_) => false);
                          }
                          await _loginWithEmailAndPassword();
                        }),
                    SizedBox(height: size.height * 0.03),
                    Row(children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColors.darkSecondaryText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'or',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkSecondaryText,
                            fontFamily: 'SF Pro Display',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ]),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      'Sign in with',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightPrimaryText,
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    SocialMediaContainer(
                      text: 'Facebook',
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightPrimaryText,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (ctx) => const SignupScreen()),
                          );
                        },
                        child: Text(
                          ' Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryBlue,
                            fontFamily: 'SF Pro Display',
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
