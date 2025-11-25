import 'package:flutter/material.dart';
import 'package:from_app/presentation/authentication/login_page.dart';
import 'package:from_app/presentation/authentication/splash_screeen.dart';
import 'package:from_app/provider/auth_provider.dart';
import 'package:from_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),

        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(title: 'Flutter Demo', home: SplashScreen()),
    );
  }
}
