import 'package:flutter/material.dart';
import 'package:twf_clone/screens/splash/components/body.dart';
import 'package:twf_clone/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
