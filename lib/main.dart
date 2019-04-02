import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/rss/main_index.dart';
import 'package:flutter_app/rss/main_drawer_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
            primarySwatch: Colors.red,
            backgroundColor: Colors.white,
            primaryColor: Colors.red),
        home: Scaffold(
          drawer: MyDrawer(),
          body: Index(),

        )

    );


  }


}