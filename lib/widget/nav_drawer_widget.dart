import 'package:flutter/material.dart';
import 'package:flutterproject/consts.dart';
import 'package:flutterproject/page/people_page.dart';
import 'package:flutterproject/page/fav_page.dart';
import 'package:flutterproject/page/notifs_page.dart';
import 'package:flutterproject/page/plugin_page.dart';
import 'package:flutterproject/page/updates_page.dart';
import 'package:flutterproject/page/workflow_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build (BuildContext context) {
    final name = "John Potter";
    final email = "johnpotter@wiz.com";
    final imageUrl = "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg";
    return Drawer(
      child: Material(
        color: IndigoBlue,
        child: ListView(
          children: <Widget>[
            buildHeader(
                name: name,
                email: email,
                imageUrl: imageUrl,
        ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'People',
              icon: Icons.people_alt_outlined,
              onClick: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Favourites',
              icon: Icons.favorite_border,
              onClick: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Workflow',
              icon: Icons.group_work_sharp,
              onClick: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Updates',
              icon: Icons.system_update,
              onClick: () => selectedItem(context, 3),
            ),
            const SizedBox(height: 24,),
            Divider(color: AccentBlue, indent: 24, endIndent: 24,),
            const SizedBox(height: 24,),

            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Plugins',
              icon: Icons.settings_input_hdmi,
              onClick: () => selectedItem(context, 4),
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Notifications',
              icon: Icons.notifications,
              onClick: () => selectedItem(context, 5),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClick,
}) {
  final color = White;
  final hoverColor = AccentBlue;

  return ListTile(
    leading: Icon(icon, color: color,),
    title: Text(text, style: TextStyle(color: color),),
    onTap: onClick,
    hoverColor: hoverColor,
  );
}

Widget buildHeader({
  required String name,
  required String email,
  required String imageUrl,
}) => InkWell(
  child: Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    child: Row(
      children: [
        CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl),),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              email,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundColor: AccentBlue,
          child: Icon(Icons.add),
        ),
      ],
  ),
  ),
);

void selectedItem(BuildContext context, int index){
  Navigator.of(context).pop();

  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PeoplePage(),
      )); //MaterialPageRoute
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FavPage(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WorkflowPage(),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UpdatesPage(),
      )); //MaterialPageRoute
      break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PluginPage(),
      )); //MaterialPageRoute
      break;
    case 5:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => NotifsPage(),
      )); //MaterialPageRoute
      break;
  }
}