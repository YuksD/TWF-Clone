import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twf_clone/kort1_rezervasyon_provider.dart';
import 'package:twf_clone/routs.dart';
import 'package:twf_clone/screens/splash/splash_screeen.dart';
import 'package:twf_clone/theme.dart';
import 'package:twf_clone/kort2_rezervasyon_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Kort1ReservationModel()),
        ChangeNotifierProvider(create: (context) => Kort2ReservationModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      //home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
