import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raj_contact_book/Constants/color.dart';
import 'package:raj_contact_book/Constants/text_style.dart';
import 'package:raj_contact_book/Controller/variable.dart';
import 'package:raj_contact_book/View/Widget/text_form_field.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PickColor.kBlack,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Text(
              "FORGOT PASSWORD",
              style: FontTextStyle.kWhite30W500,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Unlock Your World: Rediscover Your Password!",
            style: FontTextStyle.k8B8B8B14W500.copyWith(fontSize: 18.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          CommonTextFormField(
            keyboardType: TextInputType.emailAddress,
            hintText: "Enter your email address",
            controller: RegisterVariable.emailController,
            title: "Email",
          ),
          CommonTextFormField(
            keyboardType: TextInputType.emailAddress,
            hintText: "Enter New Password",
            controller: RegisterVariable.emailController,
            title: "New Password",
          ),
          CommonTextFormField(
            keyboardType: TextInputType.emailAddress,
            hintText: "Enter Confirm Password",
            controller: RegisterVariable.emailController,
            title: "Confirm Password",
          ),
        ],
      ),
    );
  }
}
