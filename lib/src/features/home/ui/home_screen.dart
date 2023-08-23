import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:temanbumil_web/src/app.dart';
import 'package:temanbumil_web/src/components/atoms/atoms.dart';
import 'package:temanbumil_web/src/components/components.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/features/home/ui/section/home_bg_section.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/themes/my_asset.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = inject<HomeBloc>();
  final _articleScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc.init(context);
    Helper.fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
              ResponsiveWidget.isSmallScreen(context) ? 60.h : 80.h),
          child: BlocBuilder<HomeBloc, HomeState>(
              bloc: bloc,
              builder: (context, state) {
                bloc.opacity = state.scrollPosition < 1.sh * 0.40
                    ? state.scrollPosition / (1.sh * 0.40)
                    : 1;
                return MyAppbar(
                  opacity: bloc.opacity,
                );
              }),
        ),
        drawer: const HomeDrawer(),
        drawerEnableOpenDragGesture: true,
        body: SingleChildScrollView(
          controller: bloc.scrollController,
          physics: const ClampingScrollPhysics(),
          child: Column(children: [
            // Home
            HomeBgSection(
              image: MyAsset.image.bg1,
              child: Container(
                width:
                    ResponsiveWidget.isSmallScreen(context) ? 0.6.sw : 0.3.sw,
                height: 1.sh,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'home.content_title'.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                color: Theme.of(context).primaryColorLight),
                      ),
                      MySizedBox.normalVertical(),
                      Text(
                        'home.content_desc'.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Theme.of(context).primaryColorLight),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MySizedBox.normalVertical(),
            //Tentang

            HomeBgSection(
              child: Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'TENTANG TEMAN BUMIL ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(color: MyColor.blueHome),
                        textAlign: TextAlign.center,
                      ),
                      MySizedBox.normalVertical(),
                      Text(
                        'Teman Bumil hadir untuk Mums dengan berbagai fitur',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: MyColor.black,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      MySizedBox.largeVertical(),
                      Wrap(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MySizedBox.bloodyLargeVertical(),
                              Image.asset(
                                MyAsset.image.ic1,
                                width: 150,
                                height: 150,
                              ),
                              MySizedBox.normalVertical(),
                              Text(
                                'Program Hamil',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: MyColor.black,
                                    ),
                              ),
                              MySizedBox.normalVertical(),
                              SizedBox(
                                height: 40,
                                width: 250,
                                child: Text(
                                  'sedang berusaha memiliki momongan? Anda akan terbantu dengan fitur ini!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: MyColor.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              MySizedBox.bloodyLargeVertical(),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MySizedBox.bloodyLargeVertical(),
                              Image.asset(
                                MyAsset.image.ic2,
                                width: 150,
                                height: 150,
                              ),
                              MySizedBox.normalVertical(),
                              Text(
                                'Kehamilan',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: MyColor.black,
                                    ),
                              ),
                              MySizedBox.normalVertical(),
                              SizedBox(
                                height: 40,
                                width: 250,
                                child: Text(
                                  'Kehamilan Mums jadi lebih menyenangkan dengan berbagai fitur menarik!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: MyColor.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              MySizedBox.bloodyLargeVertical(),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MySizedBox.bloodyLargeVertical(),
                              Image.asset(
                                MyAsset.image.ic3,
                                width: 150,
                                height: 150,
                              ),
                              MySizedBox.normalVertical(),
                              Text(
                                'Tumbuh Kembang Anak',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: MyColor.black,
                                    ),
                              ),
                              MySizedBox.normalVertical(),
                              SizedBox(
                                height: 40,
                                width: 280,
                                child: Text(
                                  'Memantau tumbuh-kembang si Kecil sangat penting untuk memaksimalkan 1000 hari pertamanya.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: MyColor.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              MySizedBox.bloodyLargeVertical(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MySizedBox.bloodyLargeVertical(),

            //Fitur
            HomeBgSection(
              image: MyAsset.image.bg2,
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
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
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
                          padding: const EdgeInsets.only(left: 200),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 240),
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
                                      MyAsset.image.tbProd,
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: MyColor.white,
                                      ),
                                  textAlign: TextAlign.right,
                                ),
                              ),

                              //forum
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 260),
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
                                      MyAsset.image.tbFor,
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: MyColor.white,
                                      ),
                                  textAlign: TextAlign.right,
                                ),
                              ),

                              //artikel
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 260),
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
                                      MyAsset.image.icArc,
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: MyColor.white,
                                      ),
                                  textAlign: TextAlign.right,
                                ),
                              ),

                              //Jurnal
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 260),
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
                                      MyAsset.image.icAlb,
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: MyColor.white,
                                      ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 150,
                          ),
                          child: Image.asset(
                            MyAsset.image.tbHome,
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
                              padding: const EdgeInsets.only(right: 200),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 30,
                                        ),
                                        child: Image.asset(
                                          MyAsset.image.icMed,
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      MySizedBox.bloodySmallHorizontal(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 270),
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
                                          MyAsset.image.icRec,
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      MySizedBox.bloodySmallHorizontal(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 230),
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
                                          MyAsset.image.icTip,
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      MySizedBox.bloodySmallHorizontal(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 280),
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
                                          MyAsset.image.icProd,
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      MySizedBox.bloodySmallHorizontal(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 260),
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
            ),

            // Article & Tips
            HomeBgSection(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                        bloc: bloc,
                        builder: (contex, state) {
                          switch (state.listData.status) {
                            case STATUS.COMPLETED:
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Text(
                                      'home.article.title'.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                  ),
                                  MySizedBox.smallVertical(),
                                  CupertinoScrollbar(
                                    controller: _articleScrollController,
                                    child: Container(
                                      height: 340.h,
                                      padding: EdgeInsets.only(bottom: 40.h),
                                      child: ListView.separated(
                                        controller: _articleScrollController,
                                        itemCount:
                                            state.listData.result?.length ?? 0,
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        itemBuilder: (context, index) {
                                          final item =
                                              state.listData.result![index];
                                          return Container(
                                            width:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
                                                    ? 0.6.sw
                                                    : 100.w,
                                            child: CardArticleWidget(
                                              title: item.title,
                                              cover: item.cover,
                                              category: item.categoryTitle,
                                              createdAt: item.created,
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            MySizedBox.extraSmallHorizontal(),
                                      ),
                                    ),
                                  ),
                                  MySizedBox.normalVertical(),
                                ],
                              );
                              break;
                            case STATUS.LOADING:
                              return MyLoading();
                              break;
                            case STATUS.ERROR:
                              return MyErrorWidget(state.listData.message);
                              break;
                            default:
                              return Container();
                              break;
                          }
                        }),
                  ],
                ),
              ),
            ),
            HomeBgSection(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                        bloc: bloc,
                        builder: (contex, state) {
                          switch (state.listData.status) {
                            case STATUS.COMPLETED:
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Text(
                                      'home.tips.title'.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                  ),
                                  MySizedBox.smallVertical(),
                                  CupertinoScrollbar(
                                    controller: _articleScrollController,
                                    child: Container(
                                      height: 340.h,
                                      padding: EdgeInsets.only(bottom: 40.h),
                                      child: ListView.separated(
                                        controller: _articleScrollController,
                                        itemCount:
                                            state.listData.result?.length ?? 0,
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        itemBuilder: (context, index) {
                                          final item =
                                              state.listData.result![index];
                                          return Container(
                                            width:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
                                                    ? 0.6.sw
                                                    : 100.w,
                                            child: CardArticleWidget(
                                              title: item.title,
                                              cover: item.cover,
                                              category: item.categoryTitle,
                                              createdAt: item.created,
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            MySizedBox.extraSmallHorizontal(),
                                      ),
                                    ),
                                  ),
                                  MySizedBox.normalVertical(),
                                ],
                              );
                              break;
                            case STATUS.LOADING:
                              return MyLoading();
                              break;
                            case STATUS.ERROR:
                              return MyErrorWidget(state.listData.message);
                              break;
                            default:
                              return Container();
                              break;
                          }
                        }),
                  ],
                ),
              ),
            ),
            HomeBgSection(
              image: MyAsset.image.bg3,
              child: Container(
                width:
                    ResponsiveWidget.isSmallScreen(context) ? 0.6.sw : 0.3.sw,
                height: 1.sh,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Aplikasi untuk Ibu Milenial',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                color: Theme.of(context).primaryColorLight),
                      ),
                      MySizedBox.normalVertical(),
                      Text(
                        'Teman Bumil siap menemani Mums menjalani peran sebagai ibu, sejak fase program hamil, kehamilan, menyusui dan tumbuh kembang anak dengan nyaman dan mudah.',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Theme.of(context).primaryColorLight),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
