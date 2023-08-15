import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/components/components.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/features/home/widget/home_bg_section.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';

class HomeSectionArticleTips extends StatelessWidget {
  final _articleScrollController = ScrollController();
  final HomeBloc bloc;
  HomeSectionArticleTips(this.bloc);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        HomeBgSection(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Text(
                    'home.article.title'.tr(),
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                BlocBuilder<HomeBloc, HomeState>(
                    bloc: bloc,
                    builder: (contex, state) {
                      switch (state.listArticle.status) {
                        case ViewState.loaded:
                          return Column(
                            children: [
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    itemBuilder: (context, index) {
                                      final item =
                                          state.listArticle.data![index];
                                      return Container(
                                        width: ResponsiveWidget.isSmallScreen(
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
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Text(
                    'home.tips.title'.tr(),
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                BlocBuilder<HomeBloc, HomeState>(
                    bloc: bloc,
                    builder: (contex, state) {
                      switch (state.listArticle.status) {
                        case ViewState.loaded:
                          return Column(
                            children: [
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    itemBuilder: (context, index) {
                                      final item =
                                          state.listArticle.data![index];
                                      return Container(
                                        width: ResponsiveWidget.isSmallScreen(
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
      ],
    );
  }
}
