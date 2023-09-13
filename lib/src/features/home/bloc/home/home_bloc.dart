import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/components/molecules/dialog/login_dialog.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState());

  final repo = inject<AuthApiRepository>();
  final articleRepo = inject<ArticleApiRepository>();
  final tipsRepo = inject<TipsApiRepository>();

  final keyAbout = GlobalKey();
  final keyFeature = GlobalKey();
  final keyArticle = GlobalKey();

  final ScrollController scrollController = ScrollController();

  init(BuildContext context) async {
    emit(state.copyWith(
        menu: ViewData.loaded([
      {'menu': 'Home', 'link': 'home', 'hover': false},
      {'menu': 'Tentang', 'link': 'about', 'hover': false},
      {'menu': 'Fitur', 'link': 'feature', 'hover': false},
      {'menu': 'Artikel', 'link': 'article', 'hover': false},
      {'menu': 'Login', 'link': 'login', 'hover': false},
    ])));
    if (await Prefs.loggedIn) {
      emit(state.copyWith(
          menu: ViewData.loaded([
        {'menu': 'App', 'link': 'app', 'hover': false},
        {'menu': 'Tentang', 'link': 'about', 'hover': false},
        {'menu': 'Fitur', 'link': 'feature', 'hover': false},
        {'menu': 'Artikel', 'link': 'article', 'hover': false},
        {'menu': 'Logout', 'link': 'logout', 'hover': false},
      ])));
    }
    scrollController.addListener(scrollListener);
    eventOnLoading();
  }

  scrollListener() {
    emit(state.copyWith(scrollPosition: scrollController.position.pixels));
  }

  eventOnLoading() async {
    try {
      eventGetArticle();
      eventGetTips();
    } catch (e, s) {}
  }

  eventGetArticle() async {
    try {
      emit(state.copyWith(listArticle: ViewData.loading()));
      final response = await articleRepo.getListArticle(
        page: 1,
        categoryId: '1',
        arraySubCategoryId: '1',
        bookmark: false,
      );

      final list = response.data?.article ?? [];
      emit(state.copyWith(
        listArticle: ViewData.loaded(list),
      ));
    } catch (e, s) {
      emit(state.copyWith(listArticle: ViewData.error(e.toString())));
    }
  }

  eventGetTips() async {
    try {
      emit(state.copyWith(listTips: ViewData.loading()));
      final response = await tipsRepo.getTipsList(
          page: 1, bookmark: false, subCategoryId: '1');

      final list = response.data?.tips ?? [];
      emit(state.copyWith(
        listTips: ViewData.loaded(list),
      ));
    } catch (e, s) {
      emit(state.copyWith(listTips: ViewData.error(e.toString())));
    }
  }

  eventUpdateMenu(int index, String key, dynamic value) {
    List<Map<String, dynamic>> menu = List.from(state.menu.data ?? []);
    emit(state.copyWith(menu: ViewData.loading()));
    menu[index][key] = value;
    emit(state.copyWith(menu: ViewData.loaded(menu)));
  }

  eventOnTapMenu(BuildContext context, int index, dynamic menu) async {
    switch (menu['link']) {
      case 'login':
        final successLogin = await showDialog(
            context: context, builder: (context) => const LoginDialog());
        if (successLogin) {
          if (await Prefs.loggedIn) {
            emit(state.copyWith(
                menu: ViewData.loaded([
              {'menu': 'App', 'link': 'app', 'hover': false},
              {'menu': 'Tentang', 'link': 'about', 'hover': false},
              {'menu': 'Fitur', 'link': 'feature', 'hover': false},
              {'menu': 'Artikel', 'link': 'article', 'hover': false},
              {'menu': 'Logout', 'link': 'logout', 'hover': false},
            ])));
            eventOnLoading();
          }
        }
        break;
      case 'app':
        context.go(HomeAppScreen.routeName);
        break;
      case 'home':
        scrollController.animateTo(0,
            duration: Duration(milliseconds: 600), curve: Curves.easeIn);
        break;
      case 'about':
        Scrollable.ensureVisible(keyAbout.currentContext!,
            duration: Duration(milliseconds: 600), curve: Curves.easeIn);
        break;
      case 'feature':
        Scrollable.ensureVisible(keyFeature.currentContext!,
            duration: Duration(milliseconds: 600), curve: Curves.easeIn);
        break;
      case 'article':
        Scrollable.ensureVisible(keyArticle.currentContext!,
            duration: Duration(milliseconds: 600), curve: Curves.easeIn);
        break;
      case 'logout':
        AuthHelper.logout(context);
        emit(state.copyWith(
            menu: ViewData.loaded([
          {'menu': 'Home', 'link': 'home', 'hover': false},
          {'menu': 'Tentang', 'link': 'about', 'hover': false},
          {'menu': 'Fitur', 'link': 'feature', 'hover': false},
          {'menu': 'Artikel', 'link': 'article', 'hover': false},
          {'menu': 'Login', 'link': 'login', 'hover': false},
        ])));
        // eventOnLoading();
        break;
      default:
    }
  }
}
