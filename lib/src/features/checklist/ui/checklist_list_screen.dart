import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:temanbumil_web/src/features/checklist/bloc/bloc.dart';
import 'package:temanbumil_web/src/features/checklist/widget/checklist_card_widget.dart';
import 'package:temanbumil_web/src/repositories/models/checklist/checklist_list_response_model.dart';
import 'package:temanbumil_web/src/themes/themes.dart';
import 'package:temanbumil_web/src/widgets/widgets.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/home/ui/section/home_app_section_banner.dart';
import 'package:temanbumil_web/src/features/home/widget/home_category_horizontal_widget.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class ChecklistListScreen extends StatefulWidget {
  const ChecklistListScreen({super.key});
  static const String routeName = '/checklist';

  @override
  State<ChecklistListScreen> createState() => _ChecklistListScreenState();
}

class _ChecklistListScreenState extends State<ChecklistListScreen> {
  final bloc = inject<ChecklistListBloc>();
  RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    bloc.init(context);
    Helper.fToast.init(context);
  }

  Widget _checklistProgressBar(double percentage) {
    final wContainer = Helper.responsive(context, lg: 0.5.sw, sm: 1.sw);
    final width = (100 - percentage) / 100 * (wContainer - 64.w);
    // final width = (1.sw / 100) * (1.0 * percentage);
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.red, Colors.yellow, Colors.green],
              tileMode: TileMode.repeated,
            ),
          ),
          height: 20.w,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 20.w,
            alignment: Alignment.centerRight,
            width: wContainer,
            child: Container(
              color: Colors.white,
              width: width,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ResponsiveWidget.isSmallScreen(context) ? 60.h : 80.h),
          child: BlocBuilder<ChecklistListBloc, ChecklistListState>(
              bloc: bloc,
              builder: (context, state) {
                final opacity = state.scrollPosition < 1.sh * 0.40 ? state.scrollPosition / (1.sh * 0.40) : 0.90;

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
            dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse, PointerDeviceKind.trackpad},
          ),
          child: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: () {
              logger.e('SmartRefresher');
            },
            onLoading: () {
              bloc.eventGetChecklist(page: bloc.state.page + 1);
            },
            // footer: Text('Loading'),
            child: SingleChildScrollView(
              controller: bloc.scrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(children: [
                HomeAppSectionBanner(),
                BlocBuilder<ChecklistListBloc, ChecklistListState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return Column(
                      children: [
                        MySizedBox.smallVertical(),
                        HomeCategoryHorizontalWidget(
                          categories: (state.listFetus.data ?? []).map((e) => e.fullname).toList(),
                          selected: state.selectedFetus,
                          onTap: (value) {
                            logger.e(value);
                            bloc.eventOnChangeFetus(value);
                          },
                        ),
                        Divider(),
                        HomeCategoryHorizontalWidget(
                          categories: (state.listWeek.data ?? []).map((e) => e.title).toList(),
                          selected: state.selectedWeek,
                          onTap: (value) {
                            bloc.eventOnChangeWeek(value);
                          },
                        ),
                      ],
                    );
                  },
                ),
                BlocConsumer<ChecklistListBloc, ChecklistListState>(
                    bloc: bloc,
                    listener: (context, state) {
                      _refreshController.refreshCompleted();
                      _refreshController.loadComplete();
                    },
                    buildWhen: (prev, curr) => prev.listChecklist != curr.listChecklist,
                    builder: (context, state) {
                      switch (state.listChecklist.status) {
                        case ViewState.loaded:
                          return Column(
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 25.w, left: 16.w, right: 16.w, top: 16.w),
                                    width: Helper.responsive(context, lg: 0.5.sw, sm: 1.sw),
                                    child: Column(
                                      children: <Widget>[
                                        BlocBuilder<ChecklistListBloc, ChecklistListState>(
                                            bloc: bloc,
                                            buildWhen: (prev, curr) => prev.percentage != curr.percentage,
                                            builder: (context, state) {
                                              final data = state.percentage;

                                              if (data == null)
                                                return Container();
                                              else {
                                                return Container(
                                                  padding: EdgeInsets.all(16.w),
                                                  margin: EdgeInsets.symmetric(vertical: 10.w),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: MyColor.defaultPurple),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: <Widget>[
                                                      Text(
                                                        'Hi ${state.displayName ?? ''}, isi checklistmu',
                                                        style: MyTextStyle.contentTitle.copyWith(color: MyColor.white),
                                                      ),
                                                      Divider(
                                                        thickness: 1,
                                                        color: MyColor.white,
                                                      ),
                                                      Text(
                                                        '${state.currentCheckedList} dari ${state.totalChecklist} checklist sudah diisi',
                                                        style: MyTextStyle.contentDescription
                                                            .copyWith(color: MyColor.white),
                                                      ),
                                                      MySizedBox.extraSmallVertical(),
                                                      _checklistProgressBar(data),
                                                    ],
                                                  ),
                                                );
                                              }
                                            }),
                                        MySizedBox.extraSmallVertical(),
                                        Column(
                                          children: (state.listChecklist.data?.data?.checklist ?? [])
                                              .map((item) => ChecklistCardWidget(item,
                                                  eventChecklistClicked: (checklistNode) =>
                                                      bloc.eventChecklistClicked(checklistNode: checklistNode),
                                                  isExpanded: item == state.listChecklist.data?.data?.checklist?.first))
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          );
                          break;
                        case ViewState.loading:
                          return MyLoading();
                        case ViewState.error:
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
