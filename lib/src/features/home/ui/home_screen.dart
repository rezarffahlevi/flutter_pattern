import 'package:flutter/material.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/features/home/ui/section/home_header_section.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = inject<HomeBloc>();


  @override
  void initState() {
    super.initState();
    bloc.init(context);
    Helper.fToast.init(context);
    // Example change theme
    // App.of(context).changeTheme(ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    bloc.opacity = bloc.state.scrollPosition < screenSize.height * 0.40
        ? bloc.state.scrollPosition / (screenSize.height * 0.40)
        : 1;

    debugPrint('Opacity: ${bloc.opacity}');
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: screenSize.width < 800
          ? AppBar(
              backgroundColor: Colors.white.withOpacity(bloc.opacity),
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.blue),
              title: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => super.widget),
                  );
                },
                child: const Text(
                  'Teman Bumil',
                  style: TextStyle(
                    fontSize: 26,
                    color: Color(0xFF077BD7),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                  ),
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 70),
              child: HomeHeaderSection(opacity: bloc.opacity),
            ),
        body: Container()
      ),
    );
  }
}
