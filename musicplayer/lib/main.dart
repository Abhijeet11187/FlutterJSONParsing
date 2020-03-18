import 'package:flutter/material.dart';
import 'package:musicplayer/Pages/Details/DetailsPage/songDetails.dart';
import 'package:musicplayer/Pages/Home/HomePage/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Music'),
      routes: {
        SongDetails.routeName: (ctx) => SongDetails(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Music",textAlign: TextAlign.center,)),
        ),
        body: SongName());
  }
}
