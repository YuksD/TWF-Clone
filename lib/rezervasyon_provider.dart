import 'package:flutter/foundation.dart';

class ReservationModel extends ChangeNotifier {
  List<bool> reservations = List.generate(36, (index) => false);

  void toggleReservation(int index) {
    reservations[index] = !reservations[index];
    notifyListeners();
  }
}
