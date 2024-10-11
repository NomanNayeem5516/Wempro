import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wempro/helper/font_helper.dart';
import '../bloc/firstBloc/info_bloc.dart';
import '../bloc/firstBloc/info_event.dart';
import '../bloc/firstBloc/info_state.dart';
import '../helper/colors_helper.dart';
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        state.messageInfo.message ?? 'No message',
                        style: const TextStyle(
                            fontSize: FontHelper.dimensn_25,
                            fontWeight: FontWeight.bold,
                            color: ColorsHelper.blackColor),
                      ),
                      Text(
                        state.messageInfo.instruction ?? 'No message',
                        style: const TextStyle(
                            fontSize: FontHelper.dimensn_20,
                            fontWeight: FontWeight.bold,
                            color: ColorsHelper.primaryColor),
                      ),
                    ],
                  ),
                ),
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
