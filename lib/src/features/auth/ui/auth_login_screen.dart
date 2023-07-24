import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temanbumil_web/src/app.dart';
import 'package:temanbumil_web/src/components/atoms/atoms.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/auth/auth.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({super.key});
  static const String routeName = '/login';

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  final bloc = inject<AuthLoginBloc>();

  final txtPhoneNumber = TextEditingController();
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();
  TextEditingController textReferralCode = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc.init();
    Helper.fToast.init(context);
    // Example change theme
    // App.of(context).changeTheme(ThemeMode.light);
  }

  Widget _buildMainWidget(parentContext, AuthLoginBloc bloc) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) =>
                  statefulCarousel(context, setState)),
          MySizedBox.smallVertical(),
          _buildTabWidget(bloc),
          MySizedBox.smallVertical(),
          BlocBuilder<AuthLoginBloc, AuthLoginState>(
            bloc: bloc,
            buildWhen: (previous, current) =>
                previous.registerType != current.registerType,
            builder: (context, state) {
              switch (state.registerType) {
                case RegisterByTypeEnum.PHONE:
                  return _buildPhoneFormWidget(parentContext, bloc);
                  break;
                case RegisterByTypeEnum.EMAIL:
                  return _buildEmailFormWidget(parentContext, bloc);
                  break;
                default:
                  break;
              }
              return Container();
            },
          ),
          MySizedBox.normalVertical(),
          Text('Atau Masuk Dengan',
              textAlign: TextAlign.center,
              style: MyTextStyle.contentDescriptionMedium),
          MySizedBox.smallVertical(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                key: Key('ButtonContinueWithGoogle'),
                onTap: () {
                  // bloc.eventSignInWithGoogle(context);
                },
                child: Container(
                  key: Key('InnerContinueWithGoogle'),
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: MyColor.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: MyColor.blue)),
                  child: Image.asset(
                    MyAsset.image.google,
                  ),
                ),
              ),
              MySizedBox.smallHorizontal(),
              InkWell(
                key: Key('ButtonContinueWithFacebook'),
                onTap: () {
                  // bloc.eventSignInWithFacebook(context);
                },
                child: Container(
                  key: Key('InnerContinueWithFacebook'),
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: MyColor.blueFacebook,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    MyAsset.image.fb,
                    color: MyColor.white,
                  ),
                ),
              ),
              Row(
                children: [
                  MySizedBox.smallHorizontal(),
                  InkWell(
                    key: Key('ButtonContinueWithApple'),
                    onTap: () {
                      // bloc.eventSignInWithApple(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: MyColor.black,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        MyAsset.image.apple,
                        color: MyColor.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          MySizedBox.smallVertical(),
        ],
      ),
    );
  }

  Widget _buildTabWidget(AuthLoginBloc bloc) {
    return Container(
      color: MyColor.greyPlaceHolder,
      margin: EdgeInsets.symmetric(horizontal: 50),
      padding: EdgeInsets.all(2),
      height: 50,
      child: BlocBuilder<AuthLoginBloc, AuthLoginState>(
          bloc: bloc,
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: InkWell(
                    key: Key('ButtonTabRegisterPhone'),
                    onTap: () {
                      bloc.eventChangeRegisterType(RegisterByTypeEnum.PHONE);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: state.registerType == RegisterByTypeEnum.PHONE
                          ? MyColor.white
                          : MyColor.transparent,
                      child: Text(
                        key: Key('InnerTabRegisterPhone'),
                        'Phone',
                        style: MyTextStyle.tabTitle.copyWith(
                          color: state.registerType == RegisterByTypeEnum.PHONE
                              ? MyColor.black
                              : MyColor.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    key: Key('ButtonTabRegisterEmail'),
                    onTap: () {
                      bloc.eventChangeRegisterType(RegisterByTypeEnum.EMAIL);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: state.registerType == RegisterByTypeEnum.EMAIL
                          ? MyColor.white
                          : MyColor.transparent,
                      child: Text(
                        key: Key('InnerTabRegisterEmail'),
                        'Email',
                        style: MyTextStyle.tabTitle.copyWith(
                          color: state.registerType == RegisterByTypeEnum.EMAIL
                              ? MyColor.black
                              : MyColor.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget _buildPhoneFormWidget(parentContext, AuthLoginBloc bloc) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('No. Handphone', style: MyTextStyle.textFieldTitle),

                // BlocBuilder<AuthLoginBloc, AuthLoginState>(
                //     bloc: bloc,
                //     buildWhen: (previous, current) =>
                //         previous.phoneNumber != current.phoneNumber,
                //     builder: (context, state) {
                //       return GSCountryPicker(
                //         flagKey: Key('ButtonRegisterPhoneNumberFlag'),
                //         textFieldKey: Key('RegisterPhoneNumberTextField'),
                //         hintText: state.phoneNumber?.compareTo('') == 0 ||
                //                 state.phoneNumber == null
                //             ? 'Ex: 813123456789'
                //             : '',
                //         onPhone: (String value) {
                //           bloc.eventOnTextChange('phoneNumber', value);
                //         },
                //         onCountry: (country) {
                //           bloc.eventOnChangeCountry(country);
                //         },
                //         onSearch: (value) {
                //           print('onSearch-> $value');
                //         },
                //         textEditingController: txtPhoneNumber,
                //         textInputType: TextInputType.phone,
                //         bottomSheetTitle: 'Pilih Negara',
                //         isFieldEnable: true,
                //         isFlagEnable: true,
                //         autofocus: false,
                //       );
                //     }),
                // MySizedBox.smallVertical(),
                _buildReferralCodeButton(parentContext, bloc),
                BlocBuilder<AuthLoginBloc, AuthLoginState>(
                    bloc: bloc,
                    buildWhen: (previous, current) =>
                        previous.phoneNumber != current.phoneNumber,
                    builder: (context, state) {
                      return MyButtonRounded(
                        keyButton: Key('ButtonMasukRegisterPhone'),
                        enabled: state.phoneNumber != null,
                        title: 'MASUK',
                        onClicked: () {
                          // bloc.eventSignInWithPhone(context);
                        },
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReferralCodeButton(parentContext, AuthLoginBloc bloc) {
    return Align(
      alignment: Alignment.centerRight,
      child: BlocBuilder<AuthLoginBloc, AuthLoginState>(
          bloc: bloc,
          buildWhen: (previous, current) =>
              previous.referralCode != current.referralCode,
          builder: (context, state) {
            return MyButtonText(
              keyButton: Key('ButtonTextKodeReferal'),
              keyText: ((state.referralCode ?? '') == '')
                  ? Key('InnerKodeReferal')
                  : Key('InnerKodeReferalFilled'),
              padding: EdgeInsets.only(top: 10, bottom: 16),
              title: ((state.referralCode ?? '') == '')
                  ? 'Punya Kode Referral?'
                  : 'Kode Referal : ${state.referralCode!.toUpperCase()}',
              textStyle: TextStyle(
                fontSize: 16,
                // decoration: TextDecoration.underline,
              ),
              onTap: () {
                textReferralCode.text =
                    '${state.referralCode?.toUpperCase() ?? ''}';

                Widget widget = Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyTextField(
                      keyTextField: Key('InputKodeReferralTextField'),
                      labelText: 'KODE REFERRAL',
                      hintText: 'Silahkan masukkan kode referral',
                      keyboardType: TextInputType.text,
                      controller: textReferralCode,
                      // validator: Validators.referralCodeValidator,
                      enabled: true,
                      // textCapitalization: TextCapitalization.characters,
                      onChanged: (val) {
                        // textReferralCode.text = val.toUpperCase();
                        // textReferralCode.selection = TextSelection.fromPosition(TextPosition(offset: val.length));
                      },
                    ),
                    MySizedBox.extraSmallVertical(),
                    MyButtonRounded(
                      keyButton: Key('BtnSimpanKodeReferral'),
                      keyText: Key('InnerSimpanKodeReferral'),
                      title: 'SIMPAN',
                      onClicked: () {
                        if (textReferralCode.text != '' &&
                            textReferralCode.text.length != 8) {
                          // Utilities.showToast('Kode referral harus 8 karakter');
                        } else {
                          // bloc.eventOnTextChange(
                          //     'referralCode', textReferralCode.text);
                          // AuthArgument.referralCode = textReferralCode.text;
                          Navigator.pop(parentContext);
                        }
                      },
                    ),
                  ],
                );

                Helper.showBottomSheetWidget(
                  parentContext,
                  title: 'Masukkan Kode Referral',
                  widget: widget,
                  showCloseButton: true,
                  keyClose: Key('BtnCloseKodeReferral'),
                  keyInnerClose: Key('InnerCloseKodeReferral'),
                  closeClicked: () {},
                  enableDrag: false,
                  isDismissible: false,
                );
              },
            );
          }),
    );
  }

  Widget _buildEmailFormWidget(parentContext, AuthLoginBloc bloc) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                MyTextField(
                  keyTextField: Key('RegisterEmailTextField'),
                  controller: txtEmail,
                  labelText: 'Email',
                  hintText: 'Ex: mums@temanbumil.com',
                  onChanged: (val) {
                    bloc.eventOnTextChange('email', val);
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                MySizedBox.smallVertical(),
                MyTextField(
                  keyTextField: Key('RegisterEmailTextField'),
                  controller: txtPassword,
                  labelText: 'Password',
                  hintText: '****',
                  obscureText: true,
                  maxLine: 1,
                  onChanged: (val) {
                    bloc.eventOnTextChange('password', val);
                  },
                  keyboardType: TextInputType.visiblePassword,
                ),
                _buildReferralCodeButton(parentContext, bloc),
                BlocBuilder<AuthLoginBloc, AuthLoginState>(
                  bloc: bloc,
                  buildWhen: (previous, current) =>
                      previous.email != current.email,
                  builder: (context, state) {
                    return MyButtonRounded(
                      keyButton: Key('ButtonMasukRegisterEmail'),
                      keyText: Key('InnerMasukRegisterEmail'),
                      enabled: state.email != null,
                      title: 'MASUK',
                      onClicked: () {
                        bloc.eventOnLoginEmail(context);
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget carouselItem(
      {required BuildContext context,
      required String pic,
      required String title,
      required String description}) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(
                pic,
                height: MediaQuery.of(context).size.width * 0.5,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
          ],
        ),
        MySizedBox.smallVertical(),
        Center(
          child: Text(
            title,
            // minFontSize: 23,
            // maxFontSize: 30,
            maxLines: 1,
            style: MyTextStyle.contentTitle,
          ),
        ),
        MySizedBox.ultraSmallVertical(),
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              description,
              // minFontSize: 12,
              // maxFontSize: 16,
              maxLines: 2,
              style: TextStyle(color: MyColor.black),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  // List<Widget> _carousel(BuildContext context) {
  //   return [
  //     carouselItem(
  //         context: context,
  //         pic: GSImageAsset.carousel1,
  //         title: 'Terpercaya',
  //         description:
  //             'Semua data Mums akan terjamin privasinya dan tidak disebarluaskan'),
  //     carouselItem(
  //         context: context,
  //         pic: GSImageAsset.carousel2,
  //         title: 'Si Kecil Sebesar Apa?',
  //         description:
  //             'Pantau perkembangan janin dan tumbuh kembang anak dengan mudah di Teman Bumil'),
  //     carouselItem(
  //         context: context,
  //         pic: GSImageAsset.carousel3,
  //         title: 'Belajar Bersama Ahli',
  //         description:
  //             'Berkonsultasi online pada para ahli serta dapatkan informasi berupa artikel dan tips'),
  //     carouselItem(
  //         context: context,
  //         pic: GSImageAsset.carousel4,
  //         title: 'Tak Perlu Bingung Lagi!',
  //         description:
  //             'Yuk, tonton beragam video edukasi untuk menjawab kebingungan Mums'),
  //   ];
  // }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget statefulCarousel(BuildContext context, StateSetter setState) {
    return Column();
    // return Column(
    //   children: <Widget>[
    //     Container(
    //       height: MediaQuery.of(context).size.width * 0.8,
    //       width: MediaQuery.of(context).size.width * 0.9,
    //       child: CarouselSlider(
    //         items: _carousel(context),
    //         options: CarouselOptions(
    //           autoPlay: true,
    //           enlargeCenterPage: true,
    //           aspectRatio: 1 / 1,
    //           viewportFraction: 1 / 1,
    //           onPageChanged: (index, _) {
    //             setState(() {
    //               _current = index;
    //             });
    //           },
    //         ),
    //       ),
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: map<Widget>(
    //         _carousel(context),
    //         (index, url) {
    //           return Container(
    //             width: 10.0,
    //             height: 10.0,
    //             margin: EdgeInsets.symmetric(horizontal: 5.0),
    //             decoration: BoxDecoration(
    //               shape: BoxShape.circle,
    //               color: _current == index
    //                   ? MyColor.defaultPurple
    //                   : Colors.transparent,
    //               border: _current == index
    //                   ? Border.all(width: 1, color: Colors.transparent)
    //                   : Border.all(width: 1, color: MyColor.defaultPurple),
    //             ),
    //           );
    //         },
    //       ) as List<Widget>,
    //     ),
    //   ],
    // );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        // backgroundColor: MyColor.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                // height: MediaQuery.of(context).size.height,
                // color: MyColor.white,
                child: _buildMainWidget(context, bloc),
              ),
            ),
            // if (RemoteConfigHelper.getKeyGuestSession != null)
            //   Positioned(
            //     right: 35.w,
            //     top: kToolbarHeight,
            //     child: Align(
            //       alignment: Alignment.centerRight,
            //       child: GSTextButton(
            //         keyButton: Key('ButtonTextX'),
            //         title: 'X',
            //         fontSize: 18.sp,
            //         color: MyColor.defaultPurple,
            //         onTap: () {
            //           bloc.eventSkipLogin(context);
            //         },
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
