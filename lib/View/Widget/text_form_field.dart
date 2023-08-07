import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raj_contact_book/Constants/color.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField({
    Key? key,
    required this.keyboardType,
    required this.hintText,
    required this.controller,
    // required this.validator,
    this.suffixIcon,
    required this.title,
  }) : super(key: key);

  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController controller;
  // final FormFieldValidator validator;
  final Widget? suffixIcon;
  final String title;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            style: GoogleFonts.josefinSans(),
            keyboardType: widget.keyboardType,
            // validator: widget.validator,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a value';
              }
              return null;
            },
            controller: widget.controller,
            cursorColor: PickColor.kBlack,
            decoration: InputDecoration(
              // constraints: BoxConstraints(maxWidth: 388.w, minHeight: 56.h),
              hintText: widget.hintText,
              hintStyle: TextStyle(),
              filled: true,
              fillColor: const Color(0xffF7F7F7),
              suffixIcon: widget.suffixIcon,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: const BorderSide(color: Color(0xffE0E0E0))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: const BorderSide(color: Color(0xffE0E0E0))),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: const BorderSide(color: Colors.red)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: const BorderSide(color: Colors.red)),
            ),
          ),
        ),
      ],
    );
  }
}
