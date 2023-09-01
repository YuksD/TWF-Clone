import 'package:flutter/material.dart';
import 'package:twf_clone/constans.dart';
import 'package:twf_clone/screens/sign_in/sign_in_screen.dart';
import 'package:twf_clone/size_config.dart';
//import 'package:twf_clone/constans.dart';
//import 'package:twf_clone/screens/splash/components/splash_content.dart';
//import 'package:twf_clone/size_config.dart';
import '../../../components/default_button.dart';
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "4 adet toprak kort",
      "image": "assets/images/kort2.png",
    },
    {
      "text": "Üyelere özel plaj",
      "image": "assets/images/deniz.png",
    },
    {
      "text": "Doğanın yanı başında tenis keyfi",
      "image": "assets/images/nature.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) =>
                      splashData[index]["image"] != null && splashData[index]["text"] != null
                          ? SplashContent(
                              image: splashData[index]["image"]!,
                              text: splashData[index]["text"]!,
                            )
                          : const SizedBox(),
                )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 2),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    const Spacer()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
