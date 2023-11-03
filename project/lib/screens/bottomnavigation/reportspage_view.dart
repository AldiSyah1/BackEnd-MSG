import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../data/data.dart';
import '../log_reg/login_view.dart';
import '../menuitem/settings_view.dart';
import 'profile_view.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('keepLoggedIn', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reports',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorPalette.primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'item1') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              } else if (value == 'item2') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              } else if (value == 'item3') {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              }
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: Text(
                  'Profile',
                  style: TextStyle(color: Color.fromARGB(251, 91, 94, 95)),
                ),
                value: 'item1',
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                child: Text(
                  'Settings',
                  style: TextStyle(color: Color.fromARGB(251, 91, 94, 95)),
                ),
                value: 'item2',
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                  child: Text(
                    'Log Out',
                    style: TextStyle(color: Color.fromARGB(251, 91, 94, 95)),
                  ),
                  value: 'item3',
                  onTap: () => logout(context)),
              //tambahkan menu disini
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: listProduct.map((data) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            '${data['namaProduct']}',
                            style: const TextStyle(
                                color: ColorPalette.primaryDarkColor),
                          )),
                          Expanded(
                              child: Text(
                            '${data['pemasok']}',
                            style: const TextStyle(
                                color: ColorPalette.primaryDarkColor),
                          )),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              const Text(
                                'Sold',
                                style: TextStyle(color: ColorPalette.textColor),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.fire_truck,
                                    size: 25,
                                    color: ColorPalette.textColor,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    '${data['stok']} Items',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: ColorPalette.primaryDarkColor),
                                  )
                                ],
                              ),
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              const Text(
                                'Stok',
                                style: TextStyle(color: ColorPalette.textColor),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.inventory,
                                    size: 25,
                                    color: ColorPalette.textColor,
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    '${data['stok']} Items',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: ColorPalette.primaryDarkColor),
                                  )
                                ],
                              ),
                            ],
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
