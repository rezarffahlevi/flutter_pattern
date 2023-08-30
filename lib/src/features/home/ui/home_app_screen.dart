import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/components/atoms/atoms.dart';
import 'package:temanbumil_web/src/components/components.dart';
import 'package:temanbumil_web/src/features/home/ui/section/home_app_section_banner.dart';
import 'package:temanbumil_web/src/features/home/widget/home_category_horizontal_widget.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_model.dart';

import '../../../configs/configs.dart';
import '../../../repositories/repositories.dart';
import '../bloc/bloc.dart';

class HomeAppScreen extends StatefulWidget {
  const HomeAppScreen({super.key});
  static const String routeName = '/home-app';

  @override
  State<HomeAppScreen> createState() => _HomeAppScreenState();
}

class _HomeAppScreenState extends State<HomeAppScreen> {
  final bloc = inject<HomeAppBloc>();

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
          child: BlocBuilder<HomeAppBloc, HomeAppState>(
              bloc: bloc,
              builder: (context, state) {
                final opacity = state.scrollPosition < 1.sh * 0.40
                    ? state.scrollPosition / (1.sh * 0.40)
                    : 0.90;

                return MyAppbar(
                  opacity: 0.90,
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
        drawer: BlocBuilder<HomeAppBloc, HomeAppState>(
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
            HomeAppSectionBanner(),
            BlocBuilder<HomeAppBloc, HomeAppState>(
                bloc: bloc,
                builder: (context, state) {
                  switch (state.listArticle.status) {
                    case ViewState.LOADED:
                      return Column(
                        children: [
                          HomeCategoryHorizontalWidget(
                            categories: ['Promil', 'Kehamilan', 'Ga tau'],
                            selected: state.selectedCategory,
                            onTap: (value) {
                              bloc.eventOnChangeCategory(value);
                            },
                          ),
                          Wrap(
                            direction: Axis.horizontal,
                            // alignment: WrapAlignment.center,
                            children: [
                              for (ArticleModel item
                                  in state.listArticle.data ?? [])
                                InkWell(
                                  onTap: () {
                                    bloc.eventOnTapArticle(context, item);
                                  },
                                  child: Container(
                                    width: Helper.responsive(context,
                                        lg: 80.w, md: 140.w, sm: 0.94.sw),
                                    height: Helper.responsive(context,
                                        lg: 50.w, md: 100.w, sm: 200.w),
                                    margin: EdgeInsets.all(6.w),
                                    child: CardParallax(
                                      imageUrl: item.cover,
                                      name: item.title,
                                      category: item.categoryTitle,
                                    ),
                                  ),
                                ),
                              for (TipsModel item in state.listTips.data ?? [])
                                Container(
                                  width: Helper.responsive(context,
                                      lg: 80.w, md: 140.w, sm: 0.94.sw),
                                  height: Helper.responsive(context,
                                      lg: 50.w, md: 100.w, sm: 200.w),
                                  margin: EdgeInsets.all(6.w),
                                  child: CardTips(
                                    cover: item.cover,
                                    title: item.title,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      );
                      break;
                    case ViewState.LOADING:
                      return MyLoading();
                    case ViewState.ERROR:
                      return MyErrorWidget(state.listArticle.message);
                    default:
                      return Container();
                      break;
                  }
                })
          ]),
        ),
      ),
    );
  }
}
