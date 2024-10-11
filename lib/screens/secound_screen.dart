import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wempro/bloc/secendBloc/secand_bloc.dart';
import 'package:wempro/networkManager/repository.dart';
import '../bloc/secendBloc/secand_event.dart';
import '../bloc/secendBloc/secand_state.dart';


class SecoundScreen extends StatefulWidget {
  const SecoundScreen({Key? key}) : super(key: key);

  @override
  State<SecoundScreen> createState() => _SecoundScreenState();
}

class _SecoundScreenState extends State<SecoundScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SecandBloc>(
      create: (context) => SecandBloc(Repository())..add(FetchSecand()), // Trigger the event to fetch data
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Secand Screen'),
        ),
        body: BlocBuilder<SecandBloc, SecandState>(
          builder: (context, state) {
            if (state is SecandLoading) {
              return const Center(child: CircularProgressIndicator()); // Show loading indicator
            } else if (state is SecandLoaded) {
              final secantData = state.message; // Access the fetched data
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Message: ${secantData.message ?? "No message"}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Assignment Instructions: ${secantData.assignmentInstructionUrl ?? "N/A"}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Information: ${secantData.information ?? "No information"}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    // Display jsonResponse data if needed
                    if (secantData.jsonResponse != null) ...[
                      const SizedBox(height: 20),
                      const Text('Attributes:', style: TextStyle(fontSize: 20)),
                      Expanded(
                        child: ListView.builder(
                          itemCount: secantData.jsonResponse!.attributes?.length ?? 0,
                          itemBuilder: (context, index) {
                            final attribute = secantData.jsonResponse!.attributes![index];
                            return ListTile(
                              title: Text(attribute.title ?? "No title"),
                              subtitle: Text('Type: ${attribute.type ?? "N/A"}'),
                              trailing: Text(
                                attribute.options?.join(", ") ?? "N/A",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            );
                          },
                        ),
                      ),
                    ]
                  ],
                ),
              );
            } else if (state is SecandError) {
              return Center(child: Text('Error: ${state.error}'));
            }
            return const Center(child: Text('Unexpected state'));
          },
        ),
      ),
    );
  }
}
