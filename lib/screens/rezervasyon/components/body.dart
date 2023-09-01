import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twf_clone/size_config.dart';

import '../../../rezervasyon_provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reservationModel = Provider.of<ReservationModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Rezervasyon Uygulaması'),
      ),
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
              reservationModel.toggleReservation(index);
            },
            child: Container(
              color: reservationModel.reservations[index] ? Colors.red : Colors.green,
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
                      reservationModel.reservations[index] ? 'rez' : '',
                      style: TextStyle(
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
