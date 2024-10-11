import 'package:equatable/equatable.dart';

import '../../models/message.dart';



abstract class MessageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MessageInitial extends MessageState {}

class MessageLoading extends MessageState {}

class MessageLoaded extends MessageState {
  final info messageInfo;

  MessageLoaded(this.messageInfo);

  @override
  List<Object?> get props => [messageInfo];
}

class MessageError extends MessageState {
  final String error;

  MessageError(this.error);

  @override
  List<Object?> get props => [error];
}
