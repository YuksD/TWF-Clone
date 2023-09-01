import 'package:flutter/material.dart';
import 'package:twf_clone/screens/details/components/body.dart';
import '../../models/Product.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  @override
  Widget build(BuildContext context) {
    // final ProductDetailsArguments arguments = ModalRoute.of(context)settings.arguments;
    final ProductDetailsArguments? arguments =
        ModalRoute.of(context)?.settings.arguments as ProductDetailsArguments?;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: arguments?.product.rating ?? 1.1),
      body: Body(product: arguments?.product ?? demoProducts[0]),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
