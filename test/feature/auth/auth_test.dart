import 'package:flutter_test/flutter_test.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/auth/auth.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';

void main() {
  String email = 'refal@yopmail.com';
  String password = 'A123321a';

  setUpAll(() async {
    await initInjection();
  });

  group('auth emit test', () {
    test('--> change type', () {
      final bloc = AuthBloc();

      bloc.eventChangeRegisterType(RegisterByTypeEnum.EMAIL);
      expect(bloc.state.registerType, RegisterByTypeEnum.EMAIL);

      bloc.eventChangeRegisterType(RegisterByTypeEnum.PHONE);
      expect(bloc.state.registerType, RegisterByTypeEnum.PHONE);
    });

    test('--> change text', () {
      final bloc = AuthBloc();

      bloc.eventOnTextChange('email', email);
      expect(bloc.state.email, email);

      bloc.eventOnTextChange('password', password);
      expect(bloc.state.password, password);
    });
  });
}
