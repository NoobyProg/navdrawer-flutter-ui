import 'package:flutter/material.dart';
import 'package:flutterproject/widget/nav_drawer_widget.dart';
import 'package:flutterproject/widget/button_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static final String title = 'Navigation Drawer';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.blue),
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text(MyApp.title),
    ),
    body: Builder(
      builder: (context) => Container(
      alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 72),
        child: ButtonWidget(
          icon: Icons.open_in_new,
          text: 'Open Drawer',
          onClicked: () {
            Scaffold.of(context).openDrawer();
          },
        )
    ),
    ),
  );
}