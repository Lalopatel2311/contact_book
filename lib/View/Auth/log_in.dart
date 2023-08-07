import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raj_contact_book/Constants/color.dart';
import 'package:raj_contact_book/Constants/text_style.dart';
import 'package:raj_contact_book/Controller/variable.dart';
import 'package:raj_contact_book/View/Widget/text_form_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PickColor.kBlack,
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SIGN IN",
                  style: FontTextStyle.kWhite30W500,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Empowering Your Call Defense!",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                CommonTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Enter Your Email",
                    controller: LoginVariable.emailController,
                    title: "Email"),
                SizedBox(
                  height: 10,
                ),
                CommonTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "Enter Your Password",
                    controller: LoginVariable.passwordController,
                    title: "Password"),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot password ?",
                        style: GoogleFonts.josefinSans(
                            textStyle: FontTextStyle.kWhite22W400),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      print(
                        "Log In Successfully!...",
                      );
                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      fixedSize: const Size(360, 45),
                      side: const BorderSide(
                        color: PickColor.k7B7B7B,
                        width: 1.50,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: PickColor.kWhite),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color(0xff5c49e0),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/google logo.png",
                        scale: 80,
                      ),
                      Text(
                        " Login with Google",
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    fixedSize: const Size(360, 45),
                    side: const BorderSide(
                      color: PickColor.k7B7B7B,
                      width: 1.50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
