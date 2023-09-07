import 'package:flutter/material.dart';
import 'package:twf_clone/screens/kort1/components/kort1.dart';

import 'components/kort2.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});
  static String routeName = "/kort1";

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageListener);
  }

  void _pageListener() {
    setState(() {
      _currentPageIndex = _pageController.page?.round() ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentPageIndex == 0 ? 'Kort 1' : 'Kort 2'),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Kort1(),
          Kort2(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }
}




// class ReservationScreen extends StatelessWidget {
//   const ReservationScreen({super.key});
//   static String routeName = "/kort1";

//   @override
//   Widget build(BuildContext context) {
//     final pageController = PageController();

//     return Scaffold(
//       body: PageView(
//         controller: pageController,
//         children: [
//           Kort1(),
//           Kort2(),
//         ],
//       ),
//     );
//   }
// }
