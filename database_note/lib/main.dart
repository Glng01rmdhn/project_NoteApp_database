import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:database_note/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  // Hapus 'const' di sini karena MyApp punya data yang bisa berubah
  runApp(MyApp()); 
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variabel dan fungsi dipindah ke sini (dalam State)
  bool isDark = false;

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // Jika belum punya class AppTheme, pakai ThemeData bawaan dulu
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Lottie.asset('assets/download.json'),
        // Kita kirim fungsi toggleTheme ke Homepage
        nextScreen: HomePage(onToggleTheme: toggleTheme),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
        splashIconSize: 150,
      ),
    );
  }
}