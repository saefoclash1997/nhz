import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/provider_services.dart';
import '../screens/welcome_screen.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  List<Widget> icons = [
    Icon(Icons.settings),
    Icon(CupertinoIcons.info),
    Icon(CupertinoIcons.power)
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Consumer<ToggleTheme>(
              builder: (context,toggleTheme,child) {
                return Checkbox(
                  value: toggleTheme.isChecked,
                  onChanged: toggleTheme.toggleCheckBox,
                );
              },
            ),
            title: const Text("Dark Theme"),
          ),
          ListTile(
            leading: icons[0] ,
            title: const Text("Settings"),
          ),          ListTile(
            leading:  icons[1],
            title: const Text("about"),
          ),
          ListTile(
            leading: icons[2],
            title: const Text("Log Out"),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, WelcomeScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
