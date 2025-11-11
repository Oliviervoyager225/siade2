import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:async';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.icon,
    required this.hint,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white24,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: isPassword,
        style:  TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Color(0xff2563EB), size: 20),
          hintText: hint,
          hintStyle:  TextStyle(color: Color(0xff64748B), fontSize: 14),
          border: InputBorder.none,
          contentPadding:  EdgeInsets.symmetric(horizontal: 20, vertical: 17),
        ),
      ),
    );
  }
}