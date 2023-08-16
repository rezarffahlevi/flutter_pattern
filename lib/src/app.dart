import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();

  static _AppState of(BuildContext context) =>
      context.findAncestorStateOfType<_AppState>()!;
}

class _AppState extends State<App> {
  ThemeMode _themeMode = ThemeMode.light;

  final authBloc = inject<AuthBloc>();
  final homeRootBloc = inject<HomeRootBloc>();

  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => authBloc,
        ),
        BlocProvider<HomeRootBloc>(
          create: (context) => homeRootBloc,
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              title: 'Teman Bumil',
              routerConfig: _router,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: MyTheme.light(),
              darkTheme: MyTheme.dark(),
              themeMode: _themeMode,
              builder: FToastBuilder(),
            );
          }),
    );
  }

  final _router = GoRouter(
    routes: Routes.appRoutes(),
    errorBuilder: (context, state) {
      return Center(
        child: Text('GoRouter Error ${state.error}'),
      );
    },
    navigatorKey: Helper.navigatorKey,
    initialLocation: CommonSplashScreen.routeName,
  );

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
    // App.of(context).changeTheme(
    //     Theme.of(context).brightness == Brightness.dark
    //         ? ThemeMode.light
    //         : ThemeMode.dark);
  }

  void toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }
}
