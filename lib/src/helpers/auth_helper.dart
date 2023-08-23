import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/features/common/ui/ui.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/helpers/my_local_data.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class AuthHelper {
  static loginHandler(context, AuthLoginResponseModel loginResponse) async {
    if (loginResponse.acknowledge == false) {
      return Helper.showErrorToast('Email atau password salah');
    }

    final user = loginResponse.data;

    MyLocalData.memberId = user?.memberId.toString();

    await Prefs.setLoggedIn(true);
    await Prefs.setMemberId(loginResponse.data!.memberId.toString());

    await Prefs.setJwtToken(loginResponse.data?.mobileSession ?? '');
    GoRouter.of(context).replace(HomeScreen.routeName);
  }
}
