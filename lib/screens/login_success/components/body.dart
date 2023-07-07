import 'package:flutter/material.dart';
import 'package:twf_clone/components/default_button.dart';
import 'package:twf_clone/size_config.dart';

import '../../home/home_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(width: double.infinity, height: SizeConfig.screenHeight! * 0.04),
        Image.asset(
          "assets/images/success_4.png",
          height: SizeConfig.screenHeight! * 0.4,
        ),
        SizedBox(width: double.infinity, height: SizeConfig.screenHeight! * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        Spacer(),
        SizedBox(
            width: SizeConfig.screenWidth! * 0.6,
            child: DefaultButton(
                text: "Back to Home",
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                })),
        Spacer()
      ],
    );
  }
}
