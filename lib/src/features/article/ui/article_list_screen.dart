import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:temanbumil_web/src/components/components.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/features/home/ui/section/home_app_section_banner.dart';
import 'package:temanbumil_web/src/features/home/widget/home_category_horizontal_widget.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_category_model.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_model.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({super.key});
  static const String routeName = '/article';

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  final bloc = inject<ArticleListBloc>();
  RefreshController _refreshController = RefreshController();

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
          child: BlocBuilder<ArticleListBloc, ArticleListState>(
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
        drawer: BlocBuilder<ArticleListBloc, ArticleListState>(
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
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            physics: const BouncingScrollPhysics(),
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
              PointerDeviceKind.trackpad
            },
          ),
          child: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: () {
              logger.e('SmartRefresher');
            },
            onLoading: () {
              bloc.eventGetArticle(page: bloc.state.page + 1);
            },
            // footer: Text('Loading'),
            child: SingleChildScrollView(
              controller: bloc.scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HomeAppSectionBanner(),
                    BlocConsumer<ArticleListBloc, ArticleListState>(
                        bloc: bloc,
                        listener: (context, state) {
                          _refreshController.refreshCompleted();
                          _refreshController.loadComplete();
                        },
                        builder: (context, state) {
                          switch (state.listArticle.status) {
                            case ViewState.loaded:
                              return Column(
                                children: [
                                  MySizedBox.smallVertical(),
                                  HomeCategoryHorizontalWidget(
                                    categories: (state.listCategory.data ?? [])
                                        .map((e) => e.title)
                                        .toList(),
                                    selected: state.selectedCategory,
                                    onTap: (value) {
                                      logger.e(value);
                                      bloc.eventOnChangeCategory(value);
                                    },
                                  ),
                                  Divider(),
                                  HomeCategoryHorizontalWidget(
                                    categories: (state
                                                .listCategory
                                                .data?[state.selectedCategory]
                                                .subCategory ??
                                            [])
                                        .map((e) => e.title)
                                        .toList(),
                                    selected: state.selectedSubCategory,
                                    onTap: (value) {
                                      bloc.eventOnChangeSubCategory(value);
                                    },
                                  ),
                                  MySizedBox.smallVertical(),
                                  Wrap(
                                    direction: Axis.horizontal,
                                    // alignment: WrapAlignment.center,
                                    children: [
                                      for (ArticleModel item
                                          in state.listArticle.data ?? [])
                                        InkWell(
                                          onTap: () {
                                            bloc.eventOnTapArticle(
                                                context, item);
                                          },
                                          child: Container(
                                            width: Helper.responsive(context,
                                                lg: 80.w,
                                                md: 140.w,
                                                sm: 0.94.sw),
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
                                    ],
                                  ),
                                ],
                              );
                              break;
                            case ViewState.loading:
                              return MyLoading();
                            case ViewState.error:
                              return MyErrorWidget(state.listArticle.message);
                            default:
                              return Container();
                              break;
                          }
                        })
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
