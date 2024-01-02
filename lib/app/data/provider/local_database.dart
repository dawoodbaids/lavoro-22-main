import 'package:get_storage/get_storage.dart';

abstract class LocalDatabase {
  static final GetStorage _box = GetStorage();

  static bool get isFirstTime {
    final check = _box.read('isFirstTime') ?? true;
    return check;
  }

  static set isFirstTime(bool val) {
    _box.write("isFirstTime", val);
  }
}
