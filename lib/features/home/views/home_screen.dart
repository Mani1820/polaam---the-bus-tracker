import 'package:flutter/material.dart';
import 'package:polam/core/constants/app_colors.dart';
import 'package:polam/features/home/widgets/drawer_widget.dart';
import 'package:polam/features/home/widgets/heading_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height * 1,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryBlue.withValues(
                      alpha: 0.5,
                    ),
                    AppColors.primaryBlue.withValues(
                      alpha: 0.1,
                    ),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [
                    0.1,
                    0.9,
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: HeadingRow(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
