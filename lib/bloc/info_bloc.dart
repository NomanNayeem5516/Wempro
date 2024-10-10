import 'package:flutter_bloc/flutter_bloc.dart';
import '../networkManager/repository.dart';
import 'info_event.dart';
import 'info_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final Repository repository;

  MessageBloc(this.repository) : super(MessageInitial()) {
    on<FetchMessage>((event, emit) async {
      emit(MessageLoading());
      try {
        final messageInfo = await repository.responseInfo();
        emit(MessageLoaded(messageInfo));
      } catch (e) {
        emit(MessageError('Failed to fetch message'));
      }
    });
  }
}
