import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wempro/bloc/secendBloc/secand_bloc.dart';
import 'package:wempro/networkManager/repository.dart';
import '../bloc/secendBloc/secand_event.dart';
import '../bloc/secendBloc/secand_state.dart';
import '../helper/colors_helper.dart';
import '../helper/font_helper.dart';
import '../helper/string_helper.dart';
import '../models/secandModel.dart';

class SecoundScreen extends StatefulWidget {
  const SecoundScreen({Key? key}) : super(key: key);

  @override
  State<SecoundScreen> createState() => _SecoundScreenState();
}

class _SecoundScreenState extends State<SecoundScreen> {
  // Store selected values for each attribute
  Map<String, dynamic> selectedValues = {};

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SecandBloc>(
      create: (context) => SecandBloc(Repository())..add(FetchSecand()),
      child: Scaffold(
        backgroundColor: ColorsHelper.whiteColor,
        appBar: AppBar(
          backgroundColor: ColorsHelper.whiteColor,
          title: const Text(StringHelper.second),
        ),
        body: BlocBuilder<SecandBloc, SecandState>(
          builder: (context, state) {
            if (state is SecandLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SecandLoaded) {
              final secantData = state.message;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Message: ${secantData.message ?? "No message"}',
                      style: const TextStyle(
                          fontSize: FontHelper.dimensn_18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Assignment Instructions: ${secantData.assignmentInstructionUrl ?? "N/A"}',
                      style: const TextStyle(
                          fontSize: FontHelper.dimensn_16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Information: ${secantData.information ?? "No information"}',
                      style: const TextStyle(
                          fontSize: FontHelper.dimensn_16,
                          fontWeight: FontWeight.bold),
                    ),
                    if (secantData.jsonResponse != null) ...[
                      const SizedBox(height: 20),
                      const Text('Attributes:', style: TextStyle(fontSize: 20)),
                      Expanded(
                        child: ListView.builder(
                          itemCount:
                              secantData.jsonResponse!.attributes?.length ?? 0,
                          itemBuilder: (context, index) {
                            final attribute =
                                secantData.jsonResponse!.attributes![index];

                            return Card(
                              color: ColorsHelper.whiteColor,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      attribute.title ?? "No title",
                                      style: const TextStyle(
                                        fontSize: FontHelper.dimensn_18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    _buildInputField(attribute),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print(selectedValues);
                        },
                        child: const Text('Submit'),
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

  Widget _buildInputField(Attributes attribute) {
    switch (attribute.type) {
      case 'radio':
        return _buildRadioButtons(
            attribute.options, attribute.title.toString());
      case 'dropdown':
        return _buildDropdown(attribute.options, attribute.title.toString());
      case 'checkbox':
        return _buildCheckbox(attribute.options, attribute.title.toString());
      case 'textfield':
        return _buildTextField(attribute.title.toString());
      default:
        return const Text('Unknown type');
    }
  }

  Widget _buildRadioButtons(List<String>? options, String title) {
    String? selectedValue = selectedValues[title];
    return Column(
      children: options?.map((option) {
            return RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValues[title] = value;
                });
              },
            );
          }).toList() ??
          [],
    );
  }

  Widget _buildDropdown(List<String>? options, String title) {
    String? selectedValue = selectedValues[title];
    return DropdownButton<String>(
      value: selectedValue,
      hint: const Text('Select an option'),
      onChanged: (newValue) {
        setState(() {
          selectedValues[title] = newValue;
        });
      },
      items: options?.map((option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    );
  }

  Widget _buildCheckbox(List<String>? options, String title) {
    Map<String, bool> selectedOptions = selectedValues[title] ?? {};
    return Column(
      children: options?.map((option) {
            return CheckboxListTile(
              title: Text(option),
              value: selectedOptions[option] ?? false,
              onChanged: (bool? value) {
                setState(() {
                  selectedOptions[option] = value ?? false;
                  selectedValues[title] = selectedOptions;
                });
              },
            );
          }).toList() ??
          [],
    );
  }

  Widget _buildTextField(String title) {
    String textValue = selectedValues[title] ?? '';
    return TextField(
      onChanged: (value) {
        setState(() {
          selectedValues[title] = value;
        });
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter text',
      ),
    );
  }
}
