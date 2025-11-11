import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:async';

class GradientButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final bool isFullWidth;
  final VoidCallback onTap;

   GradientButton({
    Key? key,
    required this.text,
    required this.isActive,
    this.isFullWidth = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFullWidth ? double.infinity : null,
      height: 50,
      decoration: BoxDecoration(
        gradient:  LinearGradient(
          colors: [
            Color(0xFF180468),
            Color(0xFFD2044E),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        margin:  EdgeInsets.all(2),
        decoration: BoxDecoration(
          color:  Color(0xFF180468).withOpacity(0.45),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(23),
            onTap: onTap,
            child: Center(
              child: Text(
                text,
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
