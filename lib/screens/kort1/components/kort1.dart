import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twf_clone/size_config.dart';

import '../../../kort1_rezervasyon_provider.dart';

class Kort1 extends StatelessWidget {
  const Kort1({super.key});

  @override
  Widget build(BuildContext context) {
    final kort1ReservationModel = Provider.of<Kort1ReservationModel>(context);

    return Scaffold(
      body: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 12, mainAxisExtent: SizeConfig.screenWidth! / 3),
        itemCount: 36,
        itemBuilder: (context, index) {
          final hour = index ~/ 2 + 6;
          final minute = (index % 2) *
              3; // buçuklu olmayan saatlerde çift 0 olmasını sağlamak için dakika değişkeninden sonra 0 ekledim dolayısıyla 30la değil 3 ile çarpıyoruz

          return GestureDetector(
            onTap: () {
              kort1ReservationModel.toggleReservation(index);
            },
            child: Card(
              borderOnForeground: true,
              elevation: 5,
              color: kort1ReservationModel.kort1Reservations[index] ? Colors.red : Colors.green,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$hour.$minute' '0',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      kort1ReservationModel.kort1Reservations[index] ? 'Yüksel Rez' : '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
