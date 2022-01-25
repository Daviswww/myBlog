part of 'apod_bloc.dart';

abstract class ApodState extends Equatable {
  const ApodState();

  @override
  List<Object> get props => [];
}

class ApodInitial extends ApodState {}

class ApodStateSuccess extends ApodState {
  final ApodModel apodModel;

  ApodStateSuccess(this.apodModel);

  @override
  List<Object> get props => [apodModel];
}

class ApodStateFailure extends ApodState {
  final String msg;

  ApodStateFailure(this.msg);

  @override
  List<Object> get props => [msg];
}
