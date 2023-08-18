import 'dart:html';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
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
        floatingActionButton: Container(
          margin: EdgeInsets.all(16.h),
          child: FloatingActionButton(
            onPressed: () {
              context.go(HomeAppScreen.routeName);
            },
            child: Icon(Icons.arrow_back_ios, color: Theme.of(context).colorScheme.surface,),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: SingleChildScrollView(
          controller: bloc.scrollController,
          physics: const ClampingScrollPhysics(),
          child: Container(
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
                                MySizedBox.normalVertical(),
                                HtmlWidget(detail?.description ?? ''),
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
