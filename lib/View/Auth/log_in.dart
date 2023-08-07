import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raj_contact_book/Constants/color.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 150,
                left: 30,
              ),
              child: Text("LOGIN",
                  style: GoogleFonts.josefinSans(
                    textStyle: TextStyle(
                      fontSize: 35.sp,
                      color: PickColor.kWhite,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
            CommonTextFormField(
                keyboardType: TextInputType.emailAddress,
                hintText: "Enter Your Email",
                controller: LoginVariable.emailController,
                title: "Email"),
            CommonTextFormField(
                keyboardType: TextInputType.visiblePassword,
                hintText: "Enter Your Password",
                controller: LoginVariable.passwordController,
                title: "Email"),
            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot password?",
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
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff5c49e0),
                  fixedSize: Size(330, 45),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 90,
              ),
              child: Row(
                children: [
                  Text(
                    "Don't have an account?",
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
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/google logo.png",
                      scale: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 68,
                      ),
                      child: Text(
                        "Or Login with Google",
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffea4235),
                  fixedSize: Size(
                    330,
                    45,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
