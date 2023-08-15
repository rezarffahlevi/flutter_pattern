import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/components/components.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/features/home/widget/home_bg_section.dart';
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
                final opacity = state.scrollPosition < 1.sh * 0.40
                    ? state.scrollPosition / (1.sh * 0.40)
                    : 0.90;

                return MyAppbar(
                  opacity: opacity,
                  menu: state.menu.data,
                  onHover: (index, value) {
                    bloc.eventUpdateMenu(index, 'hover', value);
                  },
                  onTap: (context, index, menu) {
                    bloc.eventOnTapMenu(context, index, menu);
                  },
                );
              }),
        ),
        drawer: BlocBuilder<HomeBloc, HomeState>(
            bloc: bloc,
            builder: (context, state) {
              return HomeDrawer(
                menu: state.menu.data ?? [],
                onTap: (context, index, menu) {
                  bloc.eventOnTapMenu(context, index, menu);
                },
              );
            }),
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
                          switch (state.listArticle.status) {
                            case ViewState.loaded:
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
                                            state.listArticle.data?.length ?? 0,
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        itemBuilder: (context, index) {
                                          final item =
                                              state.listArticle.data![index];
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
                            case ViewState.loading:
                              return MyLoading();
                              break;
                            case ViewState.error:
                              return MyErrorWidget(state.listArticle.message);
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
                          switch (state.listArticle.status) {
                            case ViewState.loaded:
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
                                            state.listArticle.data?.length ?? 0,
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        itemBuilder: (context, index) {
                                          final item =
                                              state.listArticle.data![index];
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
                            case ViewState.loaded:
                              return MyLoading();
                              break;
                            case ViewState.error:
                              return MyErrorWidget(state.listArticle.message);
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
