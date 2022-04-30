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
            'In this module, user can choose shape like cube,cylinder,sphere and it\'s customizable.',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: HomeDatalst[0].image),
    SkOnboardingModel(
        title: 'Furniture',
        description:
            'In this module,user can choose there desire furniture and order by mailing to company.',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: HomeDatalst[1].image),
    SkOnboardingModel(
        title: 'Marvel',
        description:
            'In this modules,user can render there favourite Marvel character.',
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
