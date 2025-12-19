import 'package:flutter/material.dart';
import 'package:siade2/src/features/login/pages/login.dart';
import 'package:sizer/sizer.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE8E8E8), Color(0xFFD0D0D0)],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Image centrale avec cercle gradient
              Positioned(
                top: 12.h,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 65.w,
                    height: 65.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFFF1493), // Rose vif
                          Color(0xFF00CED1), // Cyan
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(3.5),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/threeavatar.png',
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Contenu en bas
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Prêt à commencer\nl'aventure ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF6A4C93),
                          fontSize: 26.sp,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: 1.5.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          "Rejoignez SIADE 2025 dès maintenant",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF9E9E9E),
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),

                      // Bouton Sign up avec bordure gradient
                      Container(
                        width: 160,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFFF1493), Color(0xFF00CED1)],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(2.5),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(27.5),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(27.5),
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ),
                                );
                              },
                              child: Center(
                                child: ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                    colors: [
                                      Color(0xFFFF1493),
                                      Color(0xFF6A4C93),
                                    ],
                                  ).createShader(bounds),
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
                      ),

                      SizedBox(height: 6.h),
                      Text(
                        "COPYRIGHT SAHANALYTICS",
                        style: TextStyle(
                          color: Color(0xFF6A4C93).withOpacity(0.6),
                          fontSize: 12.sp,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 1.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
