import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/appTheme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final double? width;
  final double? height;
  final Color? textColor;
  final Color borderColor;
  final VoidCallback? onPressed;

  const CustomButton(
      this.text, {
        Key? key,
        this.width,
        this.height,
        this.color = AppTheme.primaryColor,
        this.borderColor = AppTheme.primaryColor,
        this.textColor = AppTheme.backgroundColor,
        this.onPressed,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color!),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // radius you want
                  side: BorderSide(
                    color: borderColor, //color
                  ),
                ))),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: textColor,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.32,
          ),
        ),
      ),
    );
  }
}
