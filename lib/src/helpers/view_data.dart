import 'helpers.dart';

extension ViewStateExtension on ViewState {
  bool get isLoading => this == ViewState.LOADING;
  bool get isInitial => this == ViewState.INITIAL;
  bool get isError => this == ViewState.ERROR;
  bool get isHasData => this == ViewState.HASDATA;
  bool get isNoData => this == ViewState.NODATA;
}

class ViewData<T> {
  final ViewState status;
  final T? data;
  final String? message;

  const ViewData({this.status = ViewState.INITIAL, this.message, this.data});

  ViewData.loading({this.status = ViewState.LOADING, this.data, this.message});

  ViewData.loaded(this.data, {this.status = ViewState.LOADED, this.message});

  ViewData.error(this.message, {this.status = ViewState.ERROR, this.data});

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
