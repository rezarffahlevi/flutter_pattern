import 'package:temanbumil_web/src/helpers/helpers.dart';

class Response<T> {
  final STATUS status;
  final T? result;
  final String? message;

  const Response({this.status = STATUS.INITIAL, this.message, this.result});

  Response.loading({this.status = STATUS.LOADING, this.message, this.result});

  Response.completed(this.result,
      {this.status = STATUS.COMPLETED, this.message});

  Response.error(this.message, {this.status = STATUS.ERROR, this.result});

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Result : $result";
  }
}
