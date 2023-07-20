class MyAsset {
  static _Image get image => _Image.custom();

  static String get google => 'images/ic-google.png';


}

class _Image {
  _Image.custom();

  String get google => 'images/ic-google.png';
  String get fb => 'images/ic-fb.png';
  String get apple => 'images/ic-apple.png';
}