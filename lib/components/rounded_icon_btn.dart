import 'package:flutter/material.dart';

import '../size_config.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    super.key,
    required this.iconData,
    required this.press,
  });
  final IconData iconData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.white),
          child: IconButton(
            padding: const EdgeInsets.only(left: 5),
            splashRadius: SizeConfig.screenWidth! * 0.07,
            icon: Icon(iconData),
            color: Colors.black,
            onPressed: press,
          ),
        ));
  }
}
