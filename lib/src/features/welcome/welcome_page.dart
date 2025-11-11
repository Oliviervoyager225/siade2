import 'package:flutter/material.dart';
import 'package:siade2/src/features/login/pages/login.dart';
import 'package:siade2/src/features/login/pages/signup_page.dart';
import 'package:sizer/sizer.dart';
import 'dart:async';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF040126),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/threeavatar.png'),
                  fit: BoxFit.none,
                  alignment: Alignment(0, -0.9),
                  scale: 1,
                ),
                color: Color(0xFF040126),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Lorem ipsum is\nplaceholder",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "Lorem ipsum is placeholder",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF180468), Color(0xFFD2044E)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Color(
                            0xFF180468,
                          ).withOpacity(0.60), // Fond violet semi-transparent
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(23),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Login(), 
                                ),
                              );
                            },
                            child: Center(
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "COPYRIGHT SAHANALYTICS",
                      style: TextStyle(
                        color: Color(0XFF60438C),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
