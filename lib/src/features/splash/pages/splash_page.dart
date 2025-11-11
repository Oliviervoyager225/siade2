import 'package:flutter/material.dart';
import 'package:siade2/src/features/login/pages/pages.dart';
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
      'title': 'Lorem ipsum is\nplaceholder',
      'subtitle': 'Lorem ipsum is placeholder',
      'bgColor': Color(0xFF040126),
      'filterColor': Color(0xFF040126),
      'alignment': Alignment(0, -1.7),
      'opacity': 0.83,
    },
    {
      'image': 'assets/images/avatar.png',
      'title': 'Lorem ipsum is\nplaceholder',
      'subtitle': 'Lorem ipsum is placeholder',
      'alignment': Alignment(0, -0.9),
    },
    {
      'image': 'assets/images/avat.png',
      'title': 'Lorem ipsum is\nplaceholder',
      'subtitle': 'Lorem ipsum is placeholder',
      'alignment': Alignment(0, -0.9),
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
      backgroundColor: Color(0xFF040126),
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          itemCount: onboardingData.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(onboardingData[index]['image']!),
                      fit: BoxFit.none,
                      alignment: onboardingData[index]['alignment'],
                      scale: 1,
                      colorFilter:
                          (index == 0) // seulement pour la première page
                          ? ColorFilter.mode(
                              onboardingData[index]['filterColor'].withOpacity(
                                onboardingData[index]['opacity'],
                              ),
                              BlendMode.srcATop,
                            )
                          : null,
                    ),
                    color: Color(0xFF040126),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          onboardingData[index]['title']!,
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
                          onboardingData[index]['subtitle']!,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onboardingData.length,
                            (index) => Container(
                              width: 2.w,
                              height: 2.w,
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                borderRadius: null,
                                color: _currentPage == index
                                    ? Color(0xff00FAFE)
                                    : Color(0xff00FAFE).withValues(alpha: 0.49),
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
            );
          },
        ),
      ),
    );
  }
}
