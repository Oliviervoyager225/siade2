import 'package:flutter/material.dart';
import 'package:siade2/src/features/welcome/welcome_page.dart';
import 'package:sizer/sizer.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, dynamic>> onboardingData = [
    {
      'image': 'assets/images/splash.png',
      'title': 'Bienvenue à\nSIADE 2025',
      'subtitle': 'Découvrez l\'événement tech de l\'année',
      'isDark': true, // Premier écran sombre
      'alignment': Alignment(0, -1.7),
    },
    {
      'image': 'assets/images/avatar.png',
      'title': 'Innovation\nTechnologique',
      'subtitle': 'Explorez les dernières avancées',
      'isDark': false, // Écrans suivants clairs
      'alignment': Alignment.center,
    },
    {
      'image': 'assets/images/avat.png',
      'title': 'Networking\n& Inspiration',
      'subtitle': 'Connectez-vous avec des experts',
      'isDark': false,
      'alignment': Alignment.center,
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < onboardingData.length - 1) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _timer?.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );
      }
    });
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          itemCount: onboardingData.length,
          itemBuilder: (context, index) {
            final bool isDark = onboardingData[index]['isDark'] ?? false;
            
            return Container(
              decoration: BoxDecoration(
                gradient: isDark
                    ? LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF1A4D5E),
                          Color(0xFF0D2838),
                        ],
                      )
                    : LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFE8E8E8),
                          Color(0xFFD0D0D0),
                        ],
                      ),
              ),
              child: Stack(
                children: [
                  // Image centrale avec cercle gradient (pour écrans clairs)
                  if (!isDark)
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
                                  onboardingData[index]['image']!,
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

                  // Image pour écran sombre
                  if (isDark)
                    Positioned(
                      top: 10.h,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(onboardingData[index]['image']!),
                            fit: BoxFit.contain,
                            alignment: onboardingData[index]['alignment'],
                          ),
                        ),
                      ),
                    ),

                  // Contenu textuel en bas
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
                            onboardingData[index]['title']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isDark ? Colors.white : Color(0xFF6A4C93),
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              onboardingData[index]['subtitle']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: isDark 
                                    ? Colors.white.withOpacity(0.7)
                                    : Color(0xFF9E9E9E),
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          
                          // Indicateurs de page
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              onboardingData.length,
                              (i) => AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                width: _currentPage == i ? 8.w : 2.w,
                                height: 2.w,
                                margin: EdgeInsets.symmetric(horizontal: 1.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _currentPage == i
                                      ? (isDark ? Color(0xff00CED1) : Color(0xFF6A4C93))
                                      : (isDark 
                                          ? Color(0xff00CED1).withOpacity(0.3)
                                          : Color(0xFFBDBDBD)),
                                ),
                              ),
                            ),
                          ),
                          
                          SizedBox(height: 6.h),
                          Text(
                            "COPYRIGHT SAHANALYTICS",
                            style: TextStyle(
                              color: isDark 
                                  ? Color(0xFF60438C)
                                  : Color(0xFF6A4C93).withOpacity(0.6),
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
            );
          },
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }
}
