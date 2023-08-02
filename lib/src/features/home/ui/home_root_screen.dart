import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class HomeRootScreen extends StatefulWidget {
  static const String routeName = '/home-root';

  const HomeRootScreen({Key? key}) : super(key: key);

  @override
  _HomeRootScreenState createState() => _HomeRootScreenState();
}

class _HomeRootScreenState extends State<HomeRootScreen> {
  late HomeRootBloc bloc;
  late AuthBloc authBloc;

  @override
  void initState() {
    bloc = context.read<HomeRootBloc>();
    authBloc = context.read<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final dimension = MediaQuery.of(context).size;

    return MultiBlocListener(
      listeners: [
        BlocListener<HomeRootBloc, HomeRootState>(
          listener: (context, state) {},
        ),
        BlocListener<AuthBloc, AuthState>(
          // listenWhen: (previous, current) => previous.currentUser?.role != previous.currentUser?.role,
          listener: (context, state) {},
        ),
      ],
      child: WillPopScope(
        onWillPop: null,
        child: BlocBuilder<HomeRootBloc, HomeRootState>(
            bloc: bloc,
            builder: (context, state) {
              return Scaffold(
                body: GestureDetector(
                  onTap: () {
                    // Helper.dismissKeyboard(context);
                  },
                  // child: bloc.children[state.index],
                  child: IndexedStack(
                    children: state.children,
                    index: state.index,
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Theme.of(context).primaryColor,
                  selectedItemColor: Theme.of(context).focusColor,
                  unselectedItemColor: Colors.grey,
                  currentIndex: state.index,
                  selectedLabelStyle: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(fontSize: 12.0, fontWeight: MyFontWeight.bold),
                  unselectedLabelStyle: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(
                          fontSize: 10.0,
                          fontWeight: MyFontWeight.bold,
                          color: MyColor.grey),
                  iconSize: 20,
                  selectedIconTheme: IconThemeData(size: 24),
                  onTap: (index) {
                    bloc.setIndex(index: index);
                  },
                  items: state.menu,
                ),
              );
            }),
      ),
    );
  }
}
