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

  String get icArc => 'images/asset_feature/icon_extra_web_tb_artikel.png';
  String get icAlb => 'images/asset_feature/icon_extra_web_tb_album.png';
  String get icRec => 'images/asset_feature/icon_extra_web_tb_redcord.png';
  String get icMed => 'images/asset_feature/icon_media.png';
  String get icProd => 'images/asset_feature/icon_produk.png';
  String get icTip => 'images/asset_feature/icon_tips.png';
  String get tbFor => 'images/asset_feature/TB-forum.png';
  String get tbProd => 'images/asset_feature/TB-productreview.png';
  String get tbHome => 'images/asset_feature/home.png';
  String get ic1 => 'images/asset_tentang/icon_extra_web_tb_checklist-01.png';
  String get ic2 => 'images/asset_tentang/icon_extra_web_tb_janin.png';
  String get ic3 => 'images/asset_tentang/icon_extra_web_tb_record.png';
}

