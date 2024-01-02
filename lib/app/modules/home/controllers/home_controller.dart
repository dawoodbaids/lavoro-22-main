import 'package:get/get.dart';

class HomeController extends GetxController {
  // Other controller logic...

  // Define the bottomNavIndex getter
  int get bottomNavIndex => _bottomNavIndex;
  int _bottomNavIndex = 0;

  // Function to change the index
  void changeIndex(int index) {
    _bottomNavIndex = index;
    update(); // Notify listeners that the index has changed
  }
}
