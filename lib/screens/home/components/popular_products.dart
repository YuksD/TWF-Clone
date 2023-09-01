import 'package:flutter/material.dart';
import 'package:twf_clone/screens/home/components/section_title.dart';

import '../../../components/product_card.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import '../../details/details_screen.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Popular Product",
          press: () {},
        ),
        SizedBox(
          height: getProportionateScreenWidth(20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length, 
              (index) {
                if(demoProducts[index].isPopular) 
                  return ProductCard(
                  product: demoProducts[index],
                  press: () => Navigator.pushNamed(
                    context, 
                    DetailsScreen.routeName,
                      arguments: ProductDetailsArguments(
                        product: demoProducts[index]),
                        ),
                );
                
                return  SizedBox.shrink();
                  },
                ),
              
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          ),
        ),
      ],
    );
  }
}
