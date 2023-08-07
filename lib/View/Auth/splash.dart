import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:raj_contact_book/Constants/color.dart';
import 'package:raj_contact_book/Constants/image_path.dart';
import 'package:raj_contact_book/Constants/text_style.dart';
import 'package:raj_contact_book/View/Auth/log_in.dart';

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
    Future.delayed(const Duration(seconds: 30000000000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LogInScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    ///  final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: PickColor.kBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: const AssetImage(ImagePath.appLogo), height: 120.sp),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "CallBlocker",
              style: FontTextStyle.kWhite30W500,
            ),
            SizedBox(height: height * 0.01),
            Text(
              "Ultimate Call Protection App",
              style: FontTextStyle.kWhite30W500,
            ),
          ],
        ),
      ),
    );
  }
}
