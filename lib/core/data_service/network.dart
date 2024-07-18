import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class Network {
  static final InternetConnection internetChecker = InternetConnection();
  static Stream<InternetStatus> checker() {
    return internetChecker.onStatusChange;
  }
}
