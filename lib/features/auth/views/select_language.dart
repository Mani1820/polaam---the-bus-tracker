import 'package:flutter/material.dart';
import 'package:polam/core/constants/app_colors.dart';
import 'package:polam/core/constants/main_button.dart';
import 'package:polam/features/auth/views/login_screen.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  int? _selectedValue; // Track selected index

  final List<String> languages = [
    'English',
    'Tamil',
    'Malayalam',
    'Telugu',
    'Kannada',
    'Hindi',
    'Punjabi',
    'Bengali',
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: media.size.height * 0.021),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Pogalaam',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightPrimaryText,
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                  ),
                  SizedBox(height: media.size.height * 0.021),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Choose your preferred Language',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightPrimaryText,
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                  ),
                  SizedBox(height: media.size.height * 0.021),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 60,
                        mainAxisSpacing: 40,
                      ),
                      itemCount: languages.length,
                      itemBuilder: (context, index) {
                        bool isSelected = _selectedValue == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedValue = index; // Update selected index
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            alignment: Alignment.center,
                            height: media.size.height * 0.07,
                            width: media.size.width * 0.07,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color.fromARGB(255, 185, 255, 255)
                                  : const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.lightSecondaryText),
                            ),
                            child: Text(
                              languages[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? const Color.fromARGB(255, 106, 105, 105)
                                    : const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: media.size.height * 0.2),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: media.size.height * 0.2,
              width: media.size.width,
              decoration: const BoxDecoration(
                color: AppColors.lightCard,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: media.size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Read our',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightPrimaryText,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      InkWell(
                        child: Text(
                          ' Privacy Policy',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryBlue,
                            fontFamily: 'SF Pro Display',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: media.size.height * 0.02),
                  MainButton(
                    text: 'Get Started',
                    type: ButtonType.primary,
                    onPressed: () {
                      if (_selectedValue != null) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (ctx) => const LoginScreen(),
                          ),
                          (_) => false,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
