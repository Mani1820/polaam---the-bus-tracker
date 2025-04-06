import 'package:flutter/material.dart';
import 'package:polam/core/constants/app_textfield.dart';
import 'package:polam/core/constants/main_button.dart';

class ForgotPassord extends StatefulWidget {
  const ForgotPassord({super.key});

  @override
  State<ForgotPassord> createState() => _ForgotPassordState();
}

class _ForgotPassordState extends State<ForgotPassord> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextfield(
                    text: 'Email',
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Add more validation if needed
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  MainButton(
                      text: 'reset password',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle password reset logic here
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text(
                                'Password reset link sent',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'SF Pro Display',
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
