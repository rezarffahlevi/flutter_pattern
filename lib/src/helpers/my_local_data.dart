/// FOR KEEP LOCAL DATA
class MyLocalData {
  static bool isNewUser = true;

  ///MEMBER
  static String? memberId;

  // GUEST
  static bool isGuestLogin = false;
  static String? latestGuestPage;
  static Object? latestGuestPageArgument;

  /// SAVEDDEEPLINK
  static String? savedDeeplink;

  static void reset() {
    savedDeeplink = null;
  }
}
