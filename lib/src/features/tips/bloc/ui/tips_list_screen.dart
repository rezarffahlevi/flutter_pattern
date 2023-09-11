import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../components/components.dart';
import '../../../../configs/configs.dart';
import '../../../../helpers/helpers.dart';
import '../../../../repositories/repositories.dart';
import '../../../home/ui/section/home_app_section_banner.dart';
import '../../../home/widget/home_category_horizontal_widget.dart';
import '../bloc.dart';

class TipsListScreen extends StatefulWidget {
  const TipsListScreen({super.key});
  static const String routeName = '/tips';

  @override
  State<TipsListScreen> createState() => _TipsListScreenState();
}

class _TipsListScreenState extends State<TipsListScreen> {
  final bloc = inject<TipsListBloc>();
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
          child: BlocBuilder<TipsListBloc, TipsListState>(
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
        drawer: BlocBuilder<TipsListBloc, TipsListState>(
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
              bloc.eventGetTips(page: bloc.state.page + 1);
            },
            // footer: Text('Loading'),
            child: SingleChildScrollView(
              controller: bloc.scrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(children: [
                HomeAppSectionBanner(),
                BlocConsumer<TipsListBloc, TipsListState>(
                    bloc: bloc,
                    listener: (context, state) {
                      _refreshController.refreshCompleted();
                      _refreshController.loadComplete();
                    },
                    builder: (context, state) {
                      if (state.listCategory.status == ViewState.LOADING) {
                        return MyLoading();
                      }

                      switch (state.listTips.status) {
                        case ViewState.LOADED:
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
                              Wrap(
                                direction: Axis.horizontal,
                                // alignment: WrapAlignment.center,
                                children: [
                                  for (TipsModel item
                                      in state.listTips.data ?? [])
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
                          return MyErrorWidget(state.listTips.message);
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
