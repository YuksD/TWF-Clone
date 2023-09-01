import 'package:flutter/material.dart';
import 'package:twf_clone/components/default_button.dart';
import 'package:twf_clone/models/Product.dart';
import 'package:twf_clone/screens/details/components/product_description.dart';
import 'package:twf_clone/screens/details/components/product_images.dart';
import 'package:twf_clone/screens/details/components/top_rounded_container.dart';
import 'package:twf_clone/size_config.dart';

import 'color_dots.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedCotainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedCotainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      ColorDots(product: product),
                      TopRoundedCotainer(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.screenWidth! * 0.15,
                              right: SizeConfig.screenWidth! * 0.15,
                              //top: getProportionateScreenWidth(15),
                              //bottom: getProportionateScreenWidth(10),
                            ),
                            child: DefaultButton(
                              text: 'Add to Cart',
                              press: () {},
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
