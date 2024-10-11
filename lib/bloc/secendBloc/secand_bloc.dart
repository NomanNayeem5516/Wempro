

import 'package:bloc/bloc.dart';
import 'package:wempro/bloc/secendBloc/secand_event.dart';
import 'package:wempro/bloc/secendBloc/secand_state.dart';

import '../../networkManager/repository.dart';

class SecandBloc extends Bloc<SecandEvent, SecandState> {
  final Repository repository;

  SecandBloc(this.repository) : super(SecandInitial()) {
    on<FetchSecand>((event, emit) async {
      emit(SecandLoading());

      try {
        final data = await repository.fetchSecand();
        emit(SecandLoaded(data));
      } catch (e) {
        emit(SecandError("Failed to fetch message"));
      }
    });
  }
}