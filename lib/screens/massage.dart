import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/info_bloc.dart';
import '../bloc/info_event.dart';
import '../bloc/info_state.dart';
import '../networkManager/repository.dart';
import '../helper/string_helper.dart';

class Massage extends StatefulWidget {
  const Massage({super.key});

  @override
  State<Massage> createState() => _MassageState();
}

class _MassageState extends State<Massage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringHelper.message),
      ),
      body: BlocProvider(
        create: (context) => MessageBloc(Repository())..add(FetchMessage()),
        child: BlocBuilder<MessageBloc, MessageState>(
          builder: (context, state) {
            if (state is MessageLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MessageLoaded) {
              return Center(
                child: Text(state.messageInfo.message ?? 'No message'),
              );
            } else if (state is MessageError) {
              return Center(child: Text(state.error));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
