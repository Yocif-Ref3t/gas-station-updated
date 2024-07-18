class RegexApp {
  RegExp emailReg = RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
  // static final arabicRegex = RegExp(r'[\u0600-\u06FF\s]+');
  // static final englishRegex = RegExp(r'^[A-Za-z0-9_.]+$');
  // // static final englishRegex = RegExp(r'[A-Za-z\s]+');

  // static bool checkPasswordLength(String string) {
  //   RegExp pattern = RegExp(r'^.{4,124}$');
  //   return pattern.hasMatch(string);
  // }

  // static String checkLanguge(String text) {
  //   if (arabicRegex.hasMatch(text)) {
  //     print("//////////////////") ;
  //     print("en") ;
  //     return "en";
  //   } else {
  //      print("//////////////////") ;
  //     print("ar") ;
  //     return 'ar';
  //   }
  // }
}
