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
                    case ViewState.loaded:
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
                                Container(
                                  width: Helper.responsive(context, lg:  80.w, md: 140.w, sm: 0.94.sw),
                                  height: Helper.responsive(context, lg:  50.w, md: 100.w, sm: 200.w),
                                  margin: EdgeInsets.all(6.w),
                                  child: CardParallax(
                                    imageUrl: item.cover,
                                    name: item.title,
                                    category: item.categoryTitle,
                                  ),
                                ),
                                for (TipsModel item
                                  in state.listTips.data ?? [])
                                Container(
                                  width: Helper.responsive(context, lg:  80.w, md: 140.w, sm: 0.94.sw),
                                  height: Helper.responsive(context, lg:  50.w, md: 100.w, sm: 200.w),
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
    );
  }
}

class Location {
  const Location({
    this.name,
    this.place,
    this.imageUrl,
  });

  final String? name;
  final String? place;
  final String? imageUrl;
}

const urlPrefix =
    'https://docs.flutter.dev/cookbook/img-files/effects/parallax';
const locations = [
  Location(
    name: 'Mount Rushmore',
    place: 'U.S.A',
    imageUrl: '$urlPrefix/01-mount-rushmore.jpg',
  ),
  Location(
    name: 'Gardens By The Bay',
    place: 'Singapore',
    imageUrl: '$urlPrefix/02-singapore.jpg',
  ),
  Location(
    name: 'Machu Picchu',
    place: 'Peru',
    imageUrl: '$urlPrefix/03-machu-picchu.jpg',
  ),
  Location(
    name: 'Vitznau',
    place: 'Switzerland',
    imageUrl: '$urlPrefix/04-vitznau.jpg',
  ),
  Location(
    name: 'Bali',
    place: 'Indonesia',
    imageUrl: '$urlPrefix/05-bali.jpg',
  ),
  Location(
    name: 'Mexico City',
    place: 'Mexico',
    imageUrl: '$urlPrefix/06-mexico-city.jpg',
  ),
  Location(
    name: 'Cairo',
    place: 'Egypt',
    imageUrl: '$urlPrefix/07-cairo.jpg',
  ),
];
