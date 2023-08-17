class MyAsset {
  static _Icons get icons => _Icons.custom();
  static _Background get background => _Background.custom();

  static String get logoWhite => 'images/logo-white.png';
  static String get logoPurple => 'images/logo-purple.png';
  
  static String get doctor => 'images/general/doctor.png';
  static String get food => 'images/general/food.png';
}

class _Icons {
  _Icons.custom();

  String get google => 'images/icons/ic-google.png';
  String get fb => 'images/icons/ic-fb.png';
  String get apple => 'images/icons/ic-apple.png';
}


class _Background {
  _Background.custom();
  String get bg1 => 'images/background/1.jpg';
  String get bg2 => 'images/background/2.jpg';
  String get bg3 => 'images/background/3.jpg';
  String get bg4 => 'images/background/4.jpg';
}