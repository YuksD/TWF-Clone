import 'package:flutter/material.dart';
import 'package:twf_clone/screens/home/components/popular_products.dart';
import 'package:twf_clone/screens/home/components/special_offer_card.dart';
import 'package:twf_clone/size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      children: [
        SizedBox(height: getProportionateScreenWidth(20)),
        const HomeHeader(),
        SizedBox(height: getProportionateScreenWidth(30)),
        const DiscountBanner(),
        SizedBox(height: getProportionateScreenWidth(30)),
        const Categories(),
        SizedBox(height: getProportionateScreenWidth(30)),
        const SpecialOffers(),
        SizedBox(height: getProportionateScreenWidth(30)),
        const PopularProducts(),
        SizedBox(height: getProportionateScreenWidth(30)),
      ],
    )));
  }
}
