import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncit/models/provider/provider.dart';
import 'package:syncit/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataProvider>(
        create: (context) => DataProvider(), 
        child: MaterialApp(
        title: 'SyncIT',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: ChatPage(),
        // home: YoutubeSearch(
        //   query: 'flutter',
        // ),
      )
    );
  }
}
