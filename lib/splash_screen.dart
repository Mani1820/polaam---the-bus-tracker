//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:polam/core/constants/app_colors.dart';
import 'package:polam/features/auth/views/select_language.dart';
//import 'package:polam/features/home/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (ctx) {
          return const SelectLanguage();
        },
        // builder: (ctx) => StreamBuilder(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (ctx, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasData) {
        //       return const HomeScreen();
        //     } else {
        //       return const SelectLanguage();
        //     }
        //   },
        // ),
      ), (_) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    _navigateToHome();
    _controller = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
      upperBound: 2,
      lowerBound: 1,
      duration: const Duration(
        seconds: 1,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _controller.drive(
                Tween(
                  begin: 0.0,
                  end: 1.0,
                ),
              ),
              child: Text(
                'Pogalaam',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                  fontFamily: 'SF Pro Display',
                ),
              ),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
