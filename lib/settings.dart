import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/home.dart';
import 'package:flutter_auth/main.dart';
import 'package:flutter_auth/signup.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Theme(
        data: ThemeData.dark(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    "",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: SizedBox(
                    width: 0,
                    child: Icon(
                      Icons.notifications,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://www.kindpng.com/picc/m/52-526237_avatar-profile-hd-png-download.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: const <Widget>[
                        Text(
                          "Luke Skywalker",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "lukeskywalker@starwars.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    "Change password",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    "Dark mode",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: SizedBox(
                    width: 30,
                    child: Text(
                      "On",
                      style:
                          TextStyle(color: Color.fromARGB(255, 142, 139, 139)),
                    ),
                  ),
                ),
              ),
              const Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    "Language",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: SizedBox(
                    width: 30,
                    child: Text(
                      "EN",
                      style:
                          TextStyle(color: Color.fromARGB(255, 142, 139, 139)),
                    ),
                  ),
                ),
              ),
              const Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    "Remove my AD",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    "Upgrade plan",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    "Delete my accountt",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    "Terms of service",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    "About",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
