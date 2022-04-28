import 'package:agumentality/Class_package/HomePageData.dart';
import 'package:agumentality/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:sk_onboarding_screen/flutter_onboarding.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final pages = [
    SkOnboardingModel(
        title: 'GeoMetric Shape',
        description:
            'Easily find your grocery items and you will get delivery in wide range',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: HomeDatalst[0].image),
    SkOnboardingModel(
        title: 'Furniture',
        description:
            'We make ordering fast, simple and free-no matter if you order online or cash',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: HomeDatalst[1].image),
    SkOnboardingModel(
        title: 'Marvel',
        description: 'Pay for order using credit or debit card',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: HomeDatalst[2].image),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SKOnboardingScreen(
        bgColor: Color(0xffF8F4FF),
        themeColor: Colors.deepPurple,
        pages: pages,
        skipClicked: (value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        getStartedClicked: (value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
      ),
    );
  }
}
