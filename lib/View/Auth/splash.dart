import 'package:flutter/material.dart';
import 'package:raj_contact_book/Constants/color.dart';
import 'package:raj_contact_book/Constants/text_style.dart';
import 'package:raj_contact_book/View/Home/all_contact.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AllContactScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    ///  final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: PickColor.kWarmBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CallBlocker",
              style: FontTextStyle.kWhite30W500,
            ),
            SizedBox(height: height * 0.01),
            Text(
              "Ultimate Call Protection App",
              style: FontTextStyle.kWhite22W400,
            ),
          ],
        ),
      ),
    );
  }
}
