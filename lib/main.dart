import 'package:flutter/material.dart';
import 'package:siade2/src/features/home/pages/home_page.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundDefault,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundDefault,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Sizer(
        builder: (context,_,_) {
          return HomePage();
        },
      ),
    );
  }
}