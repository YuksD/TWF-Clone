import 'package:flutter/foundation.dart';

class Kort1ReservationModel extends ChangeNotifier {
  List<bool> kort1Reservations = List.generate(36, (index) => false);

  void toggleReservation(int index) {
    kort1Reservations[index] = !kort1Reservations[index];
    notifyListeners();
  }
}
