import 'package:flutter/material.dart';

import '../../../../components/components.dart';
import '../../../../themes/themes.dart';
import '../../widget/home_bg_section.dart';

class HomeFeatureSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: HomeBgSection(
        image: MyAsset.image.bg2,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 5,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MySizedBox.extraLargeVertical(),
                Text(
                  'FITUR',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: MyColor.white,
                      ),
                  textAlign: TextAlign.center,
                ),
                MySizedBox.lessExtraSmallVertical(),
                Text(
                  'Nikmati beragam fitur menarik ini di Teman Bumil, khusus untuk Ibu Milenial!',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: MyColor.white,
                      ),
                  textAlign: TextAlign.center,
                ),
                MySizedBox.extraLargeVertical(),

                //HPMiles
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Image.asset(
                        MyAsset.image.tbProd,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    MySizedBox.extraSmallHorizontal(),
                    Text(
                      'Milestones',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 65,
                  ),
                  child: Text(
                    'Rangkuman perkembangan kehamilan Mums dan tumbuh kembang si Kecil dengan ilustrasi menarik dan lengkap.',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),

                //HpForum
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Image.asset(
                        MyAsset.image.tbFor,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    MySizedBox.extraSmallHorizontal(),
                    Text(
                      'Forum',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 65,
                  ),
                  child: Text(
                    'Wadah untuk saling bertukar informasi dengan sesama ibu di seluruh Indonesia.',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),

                //HpArtikel
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Image.asset(
                        MyAsset.image.icArc,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    MySizedBox.extraSmallHorizontal(),
                    Text(
                      'Artikel',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 65,
                  ),
                  child: Text(
                    'Temukan beragam informasi seputar program kehamilan, masa kehamilan, dan tumbuh kembang anak.',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),

                //HpJurnal
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Image.asset(
                        MyAsset.image.icAlb,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    MySizedBox.extraSmallHorizontal(),
                    Text(
                      'Jurnal',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 65,
                  ),
                  child: Text(
                    'Abadikan foto-foto kehamilan Mums dan pertumbuhan si Kecil di Jurnal Teman Bumil.',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),

                //HpMedia
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Image.asset(
                        MyAsset.image.icMed,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    MySizedBox.extraSmallHorizontal(),
                    Text(
                      'Media',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 65,
                  ),
                  child: Text(
                    'Tonton ratusan video edukatif seputar persiapan hamil, selama kehamilan, hingga perkembangan anak.',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),

                //HpRekam
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Image.asset(
                        MyAsset.image.icRec,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    MySizedBox.extraSmallHorizontal(),
                    Text(
                      'Rekam Medis',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 65,
                  ),
                  child: Text(
                    'Pantau dan simpan perkembangan janin, Mums, dan tumbuh kembang si Kecil secara lebih mudah.',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),

                //HpTips
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Image.asset(
                        MyAsset.image.icTip,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    MySizedBox.extraSmallHorizontal(),
                    Text(
                      'Rekam Medis',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 65,
                  ),
                  child: Text(
                    'Beragam tips ringan dan bermanfaat untuk menemani perjalanan program hamil, kehamilan, hingga tumbuh kembang anak.',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Image.asset(
                        MyAsset.image.icProd,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    MySizedBox.extraSmallHorizontal(),
                    Text(
                      'Produk',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 65,
                  ),
                  child: Text(
                    'Temukan berbagai rekomendasi produk untuk Mums dan si Kecil.',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColor.white,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),
                MySizedBox.extraLargeVertical()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
