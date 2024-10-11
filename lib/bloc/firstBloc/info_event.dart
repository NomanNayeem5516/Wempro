

import 'package:equatable/equatable.dart';

abstract class MessageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMessage extends MessageEvent {}
