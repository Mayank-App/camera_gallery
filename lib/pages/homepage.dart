import 'package:camera_gallery_assignment/pages/edit_profile.dart';
import 'package:camera_gallery_assignment/utils/route_name/route_name.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Edit Profile"),
            ElevatedButton(onPressed: onPressed, child: Text("Edit Profile"))
          ],
        ),
      ),
    );
  }

  onPressed(){

  }
}
