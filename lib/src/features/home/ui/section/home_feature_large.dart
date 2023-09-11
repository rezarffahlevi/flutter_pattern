import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/atoms/atoms.dart';
import '../../../../themes/themes.dart';
import '../../widget/home_bg_section.dart';

class HomeFeatureLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeBgSection(
      image: MyAsset.background.bg2,
      child: Container(
        // width: ResponsiveWidget.isSmallScreen(context) ? 1.5.sw : 2.sw,
        // height: 1.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MySizedBox.extraLargeVertical(),
            Text(
              'FITUR',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: MyColor.white,
                  ),
            ),
            MySizedBox.lessExtraSmallVertical(),
            Text(
              'Nikmati beragam fitur menarik ini di Teman Bumil, khusus untuk Ibu Milenial!',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: MyColor.white,
                  ),
            ),
            MySizedBox.extraLargeVertical(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //row 1
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 230),
                            child: Text(
                              'Milestones',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: MyColor.white,
                                      fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          MySizedBox.bloodySmallHorizontal(),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                            ),
                            child: Image.asset(
                              MyAsset.background.tbProd,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                        width: 250,
                        child: Text(
                          'Rangkuman perkembangan kehamilan Mums dan tumbuh kembang si Kecil dengan ilustrasi menarik dan lengkap',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: MyColor.white,
                                  ),
                          textAlign: TextAlign.right,
                        ),
                      ),

                      //forum
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 250),
                            child: Text(
                              'Forum',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: MyColor.white,
                                      fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          MySizedBox.bloodySmallHorizontal(),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Image.asset(
                              MyAsset.background.tbFor,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                        width: 250,
                        child: Text(
                          'Wadah untuk saling bertukar informasi dengan sesama ibu di seluruh Indonesia.',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: MyColor.white,
                                  ),
                          textAlign: TextAlign.right,
                        ),
                      ),

                      //artikel
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 250),
                            child: Text(
                              'Artikel',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: MyColor.white,
                                      fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          MySizedBox.bloodySmallHorizontal(),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Image.asset(
                              MyAsset.background.icArc,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                        width: 250,
                        child: Text(
                          'Temukan beragam informasi seputar program kehamilan, masa kehamilan, dan tumbuh kembang anak.',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: MyColor.white,
                                  ),
                          textAlign: TextAlign.right,
                        ),
                      ),

                      //Jurnal
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 250),
                            child: Text(
                              'Jurnal',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: MyColor.white,
                                      fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          MySizedBox.bloodySmallHorizontal(),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Image.asset(
                              MyAsset.background.icAlb,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                        width: 250,
                        child: Text(
                          'Temukan beragam informasi seputar program kehamilan, masa kehamilan, dan tumbuh kembang anak.',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: MyColor.white,
                                  ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),

                //Row2
                //BigAssPhone
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 150,
                  ),
                  child: Image.asset(
                    MyAsset.background.tbHome,
                    width: 300,
                    height: 400,
                    alignment: Alignment.topCenter,
                  ),
                ),

                //Media
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 30,
                                ),
                                child: Image.asset(
                                  MyAsset.background.icMed,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              MySizedBox.bloodySmallHorizontal(),
                              Padding(
                                padding: const EdgeInsets.only(right: 260),
                                child: Text(
                                  'Media',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: MyColor.white,
                                          fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 70,
                            width: 250,
                            child: Text(
                              'Tonton ratusan video edukatif seputar persiapan hamil, selama kehamilan, hingga perkembangan anak.',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: MyColor.white,
                                  ),
                              textAlign: TextAlign.left,
                            ),
                          ),

                          //Rekam Medis
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 30,
                                ),
                                child: Image.asset(
                                  MyAsset.background.icRec,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              MySizedBox.bloodySmallHorizontal(),
                              Padding(
                                padding: const EdgeInsets.only(right: 230),
                                child: Text(
                                  'Rekam Medis',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: MyColor.white,
                                          fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 70,
                            width: 250,
                            child: Text(
                              'Pantau dan simpan perkembangan janin, Mums, dan tumbuh kembang si Kecil secara lebih mudah.',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: MyColor.white,
                                  ),
                              textAlign: TextAlign.left,
                            ),
                          ),

                          //Tips
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 30,
                                ),
                                child: Image.asset(
                                  MyAsset.background.icTip,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              MySizedBox.bloodySmallHorizontal(),
                              Padding(
                                padding: const EdgeInsets.only(right: 260),
                                child: Text(
                                  'Tips',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: MyColor.white,
                                          fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 70,
                            width: 250,
                            child: Text(
                              'Beragam tips ringan dan bermanfaat untuk menemani perjalanan program hamil, kehamilan, hingga tumbuh kembang anak.',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: MyColor.white,
                                  ),
                              textAlign: TextAlign.left,
                            ),
                          ),

                          //Produk
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 30,
                                ),
                                child: Image.asset(
                                  MyAsset.background.icProd,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              MySizedBox.bloodySmallHorizontal(),
                              Padding(
                                padding: const EdgeInsets.only(right: 250),
                                child: Text(
                                  'Produk',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: MyColor.white,
                                          fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 70,
                            width: 250,
                            child: Text(
                              'Temukan berbagai rekomendasi produk untuk Mums dan si Kecil.',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: MyColor.white,
                                  ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}