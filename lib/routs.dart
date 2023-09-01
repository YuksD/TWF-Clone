import 'package:flutter/material.dart';
import 'package:twf_clone/screens/complete_profile/complete_profile_screen.dart';
import 'package:twf_clone/screens/details/details_screen.dart';
import 'package:twf_clone/screens/forgot_password/forgot_password_screen.dart';
import 'package:twf_clone/screens/home/home_screen.dart';
import 'package:twf_clone/screens/login_success/login_success_screen.dart';
import 'package:twf_clone/screens/otp/otp_screen.dart';
import 'package:twf_clone/screens/sign_in/sign_in_screen.dart';
import 'package:twf_clone/screens/sing_up/sign_up_screan.dart';
import 'package:twf_clone/screens/splash/splash_screeen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
};
