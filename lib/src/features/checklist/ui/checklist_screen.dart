import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';

import '../../../components/atoms/atoms.dart';
import '../../../configs/configs.dart';
import '../../../helpers/helpers.dart';
import '../../../repositories/models/fetus/fetus_model.dart';
import '../../../themes/themes.dart';
import '../../features.dart';
import '../bloc/bloc.dart';

class ChecklistScreen extends StatefulWidget {
  static const String routeName = '/checklist';
  final FetusModel? detail;
  final String id;
  const ChecklistScreen({super.key, this.detail, required this.id});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  final bloc = inject<ChecklistListBloc>();

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
            child: Icon(
              Icons.arrow_back_ios,
              color: MyColor.white,
            ),
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
            child: BlocBuilder<ChecklistListBloc, ChecklistListState>(
              bloc: bloc,
              builder: (context, state) {
                final list = state.listChecklist.data?.data;
                switch (state.listItem.status) {
                  case ViewState.LOADED:
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 5.sh,
                          color: '#CBC3E3'.toColor().withOpacity(0.2),
                          child: Image.network(
                            list?.checkIds as String,
                            fit: BoxFit.cover,
                            width: 1.sw,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.w),
                          child: Column(
                            children: [
                              Text(
                                '${list?.checklist}',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              MySizedBox.normalVertical(),
                              HtmlWidget(list?.checkIds as String,
                                  textStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surface)),
                            ],
                          ),
                        )
                      ],
                    );
                    break;
                  case ViewState.LOADING:
                    return MyLoading();
                  case ViewState.ERROR:
                    return MyErrorWidget(state.listChecklist.message);
                  default:
                    return Container();
                    break;
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
