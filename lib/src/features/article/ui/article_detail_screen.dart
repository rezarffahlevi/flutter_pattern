import 'dart:html';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/components/components.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/features/home/ui/section/home_app_section_banner.dart';
import 'package:temanbumil_web/src/features/home/widget/home_category_horizontal_widget.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_model.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class ArticleDetailScreen extends StatefulWidget {
  static const String routeName = '/article-detail';
  final ArticleModel? detail;
  final String id;
  const ArticleDetailScreen({super.key, this.detail, required this.id});

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  final bloc = inject<ArticleDetailBloc>();

  @override
  void initState() {
    super.initState();
    bloc.init(context, widget.id);
    Helper.fToast.init(
      context,
    );
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
          child: BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
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
        drawer: BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
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
          child: Container(
            margin: EdgeInsets.only(
              top: Helper.responsive(context, lg: 80.h, sm: 60.h),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                horizontal: Helper.responsive(context, lg: 40.w, sm: 0)),
            child: BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
                bloc: bloc,
                builder: (context, state) {
                  final detail = state.detail.data?.data;
                  switch (state.detail.status) {
                    case ViewState.loaded:
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: .5.sh,
                            color: '#CBC3E3'.toColor().withOpacity(0.2),
                            child: Image.network(
                              detail?.cover ?? '',
                              fit: BoxFit.cover,
                              width: 1.sw,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(12.w),
                            child: Column(
                              children: [
                                Text(
                                  '${detail?.title}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                      break;
                    case ViewState.loading:
                      return MyLoading();
                    case ViewState.error:
                      return MyErrorWidget(state.detail.message);
                    default:
                      return Container();
                      break;
                  }
                }),
          ),
        ),
      ),
    );
  }
}
