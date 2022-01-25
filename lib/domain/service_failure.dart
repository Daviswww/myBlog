import 'package:equatable/equatable.dart';

abstract class ServiceFailure extends Equatable {
  final int code;
  final String message;

  ServiceFailure({required this.code, required this.message});

  @override
  List<Object> get props => [code, message];
}

class GetFailure extends ServiceFailure {
  GetFailure({
    required int code,
    required String message,
  }) : super(code: code, message: message);
}
