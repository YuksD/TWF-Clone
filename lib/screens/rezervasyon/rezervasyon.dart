import 'package:flutter/material.dart';
import 'package:twf_clone/screens/rezervasyon/components/body.dart';

class RezervasyonScreen extends StatelessWidget {
  const RezervasyonScreen({super.key});
  static String routeName = "/rezervasyon";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rezervasyon"),
      ),
      body: Body(),
    );
  }
}
