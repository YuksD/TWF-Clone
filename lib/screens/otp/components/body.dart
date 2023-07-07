import 'package:flutter/material.dart';
import 'package:twf_clone/constans.dart';
import 'package:twf_clone/size_config.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.05),
              Text("OTP Verification", style: headingStyle),
              const Text("We sent your code to +90 535 353 ***"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight! * 0.15),
              const OtpForm(),
              SizedBox(height: SizeConfig.screenHeight! * 0.1),
              GestureDetector(
                  onTap: () {
                    // Resend your OTP
                  },
                  child: const Text("Resend OTP code",
                      style: TextStyle(decoration: TextDecoration.underline)))
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: const Duration(seconds: 25),
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        )
      ],
    );
  }
}
