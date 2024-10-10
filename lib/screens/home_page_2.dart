import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/response_list.dart';
import '../networkManager/repository.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List<ResponseList> responseList=[];
  bool loading = true;
  getData() {
    Repository().responseInList().then((value) {
      responseList = value;
      loading = false;
      setState(() {});
    }).onError((error, stackTrace) {
      print("Error=>${error.toString()}");
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
          itemCount: responseList.length,
          itemBuilder: (context, index) {
            return ListTile(

              title: Text(responseList[index].title.toString()??""),
              subtitle: Text(responseList[index].body.toString()??""),
            );
          }),
    );
  }
}
