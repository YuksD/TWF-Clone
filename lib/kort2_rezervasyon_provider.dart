import 'package:flutter/foundation.dart';

class Kort2ReservationModel extends ChangeNotifier {
  List<bool> kort2Reservations = List.generate(36, (index) => false);

  void toggleReservation(int index) {
    kort2Reservations[index] = !kort2Reservations[index];
    notifyListeners();
  }
}
