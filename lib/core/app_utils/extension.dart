//photo
import 'dart:async';

extension Photo on String {
  String png([String? path = "images"]) => 'assets/$path/$this.png';
  String svg([String path = "icons"]) => 'assets/$path/$this.svg';
  String jpg([String path = "images"]) => 'assets/$path/$this.jpg';
}

  extension  timeFormate on DateTime {
  
   String get formateDate {
    return "$year-$month-$day";
  }


}

  
