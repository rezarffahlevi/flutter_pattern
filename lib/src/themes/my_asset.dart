class MyAsset {
  static _Image get image => _Image.custom();

  static String get google => 'images/ic-google.png';
  static String get logoPurple => 'images/logo-purple.png';
  static String get logoWhite => 'images/logo-white.png';
}

class _Image {
  _Image.custom();

  String get google => 'images/ic-google.png';
  String get fb => 'images/ic-fb.png';
  String get apple => 'images/ic-apple.png';

  String get bg1 => 'images/background/1.jpg';
  String get bg2 => 'images/background/2.jpg';
  String get bg3 => 'images/background/3.jpg';
  String get bg4 => 'images/background/4.jpg';
}
