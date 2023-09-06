import 'package:temanbumil_web/src/helpers/helpers.dart';


extension ViewStateExtension on ViewState {
  bool get isLoading => this == ViewState.loading;

  bool get isInitial => this == ViewState.initial;

  bool get isError => this == ViewState.error;

  bool get isHasData => this == ViewState.hasData;

  bool get isNoData => this == ViewState.noData;
}

class ViewData<T> {
  final ViewState status;
  final T? data;
  final String? message;

  const ViewData({this.status = ViewState.initial, this.message, this.data});

  ViewData.loading({this.status = ViewState.loading, this.message, this.data});

  ViewData.loaded(this.data,
      {this.status = ViewState.loaded, this.message});

  ViewData.error(this.message, {this.status = ViewState.error, this.data});

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
