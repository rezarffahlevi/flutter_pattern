import 'package:temanbumil_web/src/helpers/helpers.dart';

class ResponseData<T> {
  final STATUS status;
  final T? result;
  final String? message;

  const ResponseData({this.status = STATUS.INITIAL, this.message, this.result});

  ResponseData.loading({this.status = STATUS.LOADING, this.message, this.result});

  ResponseData.completed(this.result,
      {this.status = STATUS.COMPLETED, this.message});

  ResponseData.error(this.message, {this.status = STATUS.ERROR, this.result});

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Result : $result";
  }
}
