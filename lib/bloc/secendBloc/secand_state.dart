import 'package:equatable/equatable.dart';

import '../../models/secandModel.dart';

abstract class SecandState extends Equatable {
  @override
  List<Object> get props => [];
}

class SecandInitial extends SecandState {}

class SecandLoading extends SecandState {}

class SecandLoaded extends SecandState {
  final secantModel message;

  SecandLoaded(this.message);

  @override
  List<Object> get props => [message];
}

class SecandError extends SecandState {
  final String error;

  SecandError(this.error);

  @override
  List<Object> get props => [error];
}
