
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/responseMap.dart';
import '../networkManager/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ResponseMap responseMap = ResponseMap();
  bool loading = true;
  getData() {
    Repository().responseInMap().then((value) {
      responseMap = value;
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
              itemCount: responseMap.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(responseMap.data?[index].avatar??""),
                  ),
                  title: Text(responseMap.data?[index].firstName??""),
                  subtitle: Text(responseMap.data?[index].firstName??""),
                );
              }),
    );
  }
}
