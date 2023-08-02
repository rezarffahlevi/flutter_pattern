import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/app.dart';
import 'package:temanbumil_web/src/components/atoms/atoms.dart';
import 'package:temanbumil_web/src/components/components.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/features/home/ui/section/home_bg_section.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/themes/my_asset.dart';

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
            HomeBgSection(
              child: Container(
                height: 1.sh,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 20.h),
                      child: Text(
                        'Artikel',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                color: Theme.of(context).primaryColorLight),
                      ),
                    ),
                    MySizedBox.extraSmallVertical(),
                    CupertinoScrollbar(
                      controller: _articleScrollController,
                      child: Container(
                        height: 340.h,
                        padding: EdgeInsets.only(bottom: 40.h),
                        child: ListView.separated(
                          controller: _articleScrollController,
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          itemBuilder: (context, index) {
                            return Container(
                              width: ResponsiveWidget.isSmallScreen(context)
                                  ? 0.4.sw
                                  : 100.w,
                              child: CardArticleWidget(
                                title: 'Hallo $index',
                                cover: 'https://picsum.photos/200/300',
                                category: 'Hallo $index',
                                createdAt: '2023-08-01',
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
                ),
              ),
            ),
            HomeBgSection(
              image: MyAsset.image.bg3,
              child: Container(
                width: 0.3.sw,
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
