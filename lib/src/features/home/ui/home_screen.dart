import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/widgets/widgets.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/features/home/ui/section/home_feature_large.dart';
import 'package:temanbumil_web/src/features/home/ui/section/home_section_about.dart';
import 'package:temanbumil_web/src/features/home/ui/section/home_section_article_tips.dart';
import 'package:temanbumil_web/src/features/home/ui/section/home_section_first.dart';
import 'package:temanbumil_web/src/features/home/ui/section/home_tentang.dart';
import 'package:temanbumil_web/src/features/home/widget/home_bg_section.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';

import 'section/home_feature_small.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = inject<HomeBloc>();

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
          preferredSize: Size.fromHeight(Helper.responsive(context, lg: 80.h, sm: 60.h)),
          child: BlocBuilder<HomeBloc, HomeState>(
              bloc: bloc,
              builder: (context, state) {
                final opacity = state.scrollPosition < 1.sh * 0.40 ? state.scrollPosition / (1.sh * 0.40) : 0.90;

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
            HomeSectionFirst(),
            Container(key: bloc.keyAbout, child: HomeTentang()),
            ResponsiveWidget(
              key: bloc.keyFeature,
              largeScreen: HomeFeatureLarge(),
              mediumScreen: HomeFeatureSmall(),
              smallScreen: HomeFeatureSmall(),
            ),
            Container(key: bloc.keyArticle, child: HomeSectionArticleTips(bloc)),
          ]),
        ),
      ),
    );
  }
}
