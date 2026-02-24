import 'package:flutter/material.dart';
import 'package:siade2/l10n/app_localizations.dart';
import 'package:siade2/src/features/welcome/welcome_page.dart';
import 'package:sizer/sizer.dart';
import 'dart:async';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (_currentPage < 2) {
        // Based on onboardingData length
        _onPageChanged(_currentPage + 1);
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 600),
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
    final l10n = AppLocalizations.of(context)!;

    final List<Map<String, dynamic>> onboardingData = [
      {
        'image': 'assets/images/splash.png',
        'title': l10n.welcomeToSiade,
        'subtitle': l10n.discoverTechEvent,
        'isDark': true,
        'alignment': Alignment(0, -1.7),
      },
      {
        'image': 'assets/images/Avatar 1.png',
        'title': l10n.innovationTitle,
        'subtitle': l10n.innovationSubtitle,
        'isDark': false,
        'alignment': Alignment.center,
      },
      {
        'image': 'assets/images/Avatar 2.png',
        'title': l10n.networkingTitle,
        'subtitle': l10n.networkingSubtitle,
        'isDark': false,
        'alignment': Alignment.center,
      },
    ];

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
                        colors: [Color(0xFF1A4D5E), Color(0xFF0D2838)],
                      )
                    : LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFE8E8E8), Color(0xFFD0D0D0)],
                      ),
              ),
              child: Stack(
                children: [
                  // Image centrale (Positionnement unifié pour light et dark)
                  Positioned(
                    top: isDark ? 10.h : 8.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 40.h,
                      child: Image.asset(
                        onboardingData[index]['image']!,
                        fit: BoxFit.contain,
                        alignment:
                            onboardingData[index]['alignment'] ??
                            Alignment.center,
                      ),
                    ),
                  ),

                  // Contenu textuel en bas
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 3.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            onboardingData[index]['title']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isDark ? Colors.white : Color(0xFF6A4C93),
                              fontSize: 22.sp,
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
                                fontSize: 13.sp,
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
                                      ? (isDark
                                            ? Color(0xff00CED1)
                                            : Color(0xFF6A4C93))
                                      : (isDark
                                            ? Color(0xff00CED1).withOpacity(0.3)
                                            : Color(0xFFBDBDBD)),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 6.h),
                          Text(
                            l10n.copyright,
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
