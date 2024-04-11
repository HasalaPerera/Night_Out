import 'package:final_ui/methods/authentication.dart';
import 'package:final_ui/pages/info.dart';
import 'package:final_ui/pages/profile.dart';
import 'package:final_ui/pages/sign%20in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(""),
            accountEmail: Text(""),
            decoration: BoxDecoration(
              color: Color(0xFF4E2464),
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("assets/sidebar.jpg")),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Night Out!'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutEmergencyPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Sign out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () async {
              await AuthMethods().signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
