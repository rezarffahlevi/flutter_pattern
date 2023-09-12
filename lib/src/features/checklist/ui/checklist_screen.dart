import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:temanbumil_web/src/repositories/models/checklist/checklist_list_response_model.dart';

import '../../../components/atoms/atoms.dart';
import '../../../configs/configs.dart';
import '../../../helpers/helpers.dart';
import '../../../repositories/models/fetus/fetus_model.dart';
import '../../../themes/themes.dart';
import '../../features.dart';
import '../../home/ui/section/home_app_section_banner.dart';
import '../../home/widget/home_category_horizontal_widget.dart';
import '../bloc/bloc.dart';

class ChecklistScreen extends StatefulWidget {
  static const String routeName = '/checklist';
  final FetusModel? detail;
  final String id;
  const ChecklistScreen({super.key, this.detail, required this.id});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  final bloc = inject<ChecklistListBloc>();
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
          child: BlocBuilder<ChecklistListBloc, ChecklistListState>(
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
        drawer: BlocBuilder<ChecklistListBloc, ChecklistListState>(
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
              bloc.eventGetChecklistList();
            },
            // footer: Text('Loading'),
            child: SingleChildScrollView(
              controller: bloc.scrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(children: [
                HomeAppSectionBanner(),
                BlocConsumer<ChecklistListBloc, ChecklistListState>(
                    bloc: bloc,
                    listener: (context, state) {
                      _refreshController.refreshCompleted();
                      _refreshController.loadComplete();
                    },
                    builder: (context, state) {
                      if (state.listItem.status == ViewState.LOADING) {
                        return MyLoading();
                      }

                      switch (state.listChecklist.status) {
                        case ViewState.LOADED:
                          return Column(
                            children: [
                              MySizedBox.smallVertical(),
                              HomeCategoryHorizontalWidget(
                                categories: (state.listFetus.data?.data ?? [])
                                    .map((e) => e.fullname)
                                    .toList(),
                                selected: state.selectedFetus,
                                onTap: (value) {
                                  logger.e(value);
                                  bloc.eventOnChangeCategory(value);
                                },
                              ),
                              Divider(),
                              // HomeCategoryHorizontalWidget(
                              //   categories: (state
                              //               .listItem
                              //               .data?[state.selectedFetus]
                              //               .checklistNode ??
                              //           [])
                              //       .map((e) => e.checkId)
                              //       .toList(),
                              //   selected: state.selectedSubCategory,
                              //   onTap: (value) {
                              //     bloc.eventOnChangeCategory(value);
                              //   },
                              // ),
                              Wrap(
                                direction: Axis.horizontal,
                                // alignment: WrapAlignment.center,
                                children: [
                                  for (ChecklistItemModel item in state
                                          .listChecklist
                                          .data
                                          ?.data
                                          ?.checklist ??
                                      [])
                                    Container(
                                      width: Helper.responsive(context,
                                          lg: 80.w, md: 140.w, sm: 0.94.sw),
                                      margin: EdgeInsets.all(6.w),
                                      child: Column(children: [
                                        Text('${item.title}'),
                                        for (ChecklistNode checklist
                                            in item.checklistNode ?? [])
                                          Text('${checklist.description}')
                                      ]),
                                    ),
                                ],
                              ),
                            ],
                          );
                          break;
                        case ViewState.LOADING:
                          return MyLoading();
                        case ViewState.ERROR:
                          return MyErrorWidget(state.listChecklist.message);
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
