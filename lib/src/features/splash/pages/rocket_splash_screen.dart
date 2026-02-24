import 'package:flutter/material.dart';
import 'package:siade2/src/features/splash/widgets/rocket_exhaust.dart';
import 'package:siade2/src/features/splash/pages/splash_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class RocketSplashScreen extends StatefulWidget {
  const RocketSplashScreen({Key? key}) : super(key: key);

  @override
  _RocketSplashScreenState createState() => _RocketSplashScreenState();
}

class _RocketSplashScreenState extends State<RocketSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _riseToLaunchStationAnimation;
  late Animation<double> _liftOffFromLaunchStationAnimation;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isVisible = false;
        });
        // Navigate to the next screen after animation completes
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const SplashPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 600),
              ),
            );
          }
        });
      }
    });

    _riseToLaunchStationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
    ));

    _liftOffFromLaunchStationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeInCirc),
    ));

    // Auto-start the animation immediately
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: const Color.fromARGB(255, 116, 4, 208),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return RocketExhaustWidget(
                launchProgress: _liftOffFromLaunchStationAnimation.value > 0
                    ? ((screenHeight * 2) *
                            _liftOffFromLaunchStationAnimation.value +
                        screenHeight / 4)
                    : screenHeight / 4 * _riseToLaunchStationAnimation.value,
              );
            },
          ),
          if (_isVisible)
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Positioned(
                  left: 0,
                  right: 0,
                  bottom: _liftOffFromLaunchStationAnimation.value > 0
                      ? ((screenHeight * 2) *
                              _liftOffFromLaunchStationAnimation.value +
                          screenHeight / 4)
                      : screenHeight / 4 * _riseToLaunchStationAnimation.value,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24),
                      ),
                      child: const Icon(Icons.rocket),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
