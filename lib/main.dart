import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siade2/src/features/splash/pages/pages.dart';
import 'package:siade2/src/providers/providers.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Sizer(
          builder: (context, _, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'SIADE 2',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeProvider.themeMode,
              home: SplashPage(),
            );
          },
        );
      },
    );
  }
}
