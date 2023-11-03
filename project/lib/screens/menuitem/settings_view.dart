import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../providers/UsersProviders.dart';
import '../bottomnavigation/homepage_view.dart';
import 'about_view.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  static const routeName = "/settingsPage";

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool switchVal = false;

  @override
  Widget build(BuildContext context) {
    final provIdUser = Provider.of<UsersProvider>(context);
    final user = Provider.of<UsersProvider>(context).getUser(provIdUser.id);

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: ColorPalette.primaryColor,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, HomePage.routeName);
            },
          )),
      body: ListView(
        children: [
          ListTile(
            title: const Text("My Account"),
            trailing: Text('${user.username}'),
            tileColor: Colors.grey,
            textColor: const Color.fromARGB(251, 91, 94, 95),
            iconColor: const Color.fromARGB(251, 91, 94, 95),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Account"),
            trailing: const Icon(Icons.arrow_forward),
            textColor: const Color.fromARGB(251, 91, 94, 95),
            iconColor: const Color.fromARGB(251, 91, 94, 95),
            onTap: () {
              Navigator.pushNamed(context, "/profilePage");
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text("Your Number"),
            trailing: const Icon(Icons.arrow_forward),
            textColor: const Color.fromARGB(251, 91, 94, 95),
            iconColor: const Color.fromARGB(251, 91, 94, 95),
            onTap: () {},
          ),
          ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text("Notification"),
              textColor: const Color.fromARGB(251, 91, 94, 95),
              iconColor: const Color.fromARGB(251, 91, 94, 95),
              trailing: Switch(
                  value: switchVal,
                  activeColor: ColorPalette.primaryColor,
                  onChanged: (bool val) {
                    setState(() {
                      switchVal = val;
                      print(switchVal);
                    });
                  })),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About Us"),
            textColor: const Color.fromARGB(251, 91, 94, 95),
            iconColor: const Color.fromARGB(251, 91, 94, 95),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Sign Out"),
            textColor: const Color.fromARGB(251, 91, 94, 95),
            iconColor: const Color.fromARGB(251, 91, 94, 95),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
          ),
        ],
      ),
    );
  }
}
