import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);
  static const keyDarkMode = 'dark-mode';
  final keyLanguage = 'language';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 21, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue.shade300,
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.grey.shade500,
                ),
                radius: 40,
              ),
              SwitchSettingsTile(
                leading: Icon(
                  Icons.dark_mode,
                  color: Colors.red,
                ),
                title: "Dark Mode",
                settingKey: keyDarkMode,
                onChange: (value) {},
              ),
              SettingsGroup(title: "GENERAL", children: [
                DropDownSettingsTile(
                  title: "Language",
                  settingKey: keyLanguage,
                  selected: 1,
                  values: {1: "English", 2: "Spanish", 3: "French"},
                ),
                DropDownSettingsTile(
                  title: "Country",
                  settingKey: keyLanguage,
                  selected: 1,
                  values: {1: "Nigeria", 2: "France", 3: "China"},
                )
              ]),
              SettingsGroup(
                title: "FEEDBACK",
                children: [
                  SimpleSettingsTile(
                    title: "Report a bug",
                    subtitle: '',
                    onTap: () {},
                  ),
                  SimpleSettingsTile(
                    title: "Contact Us",
                    subtitle: '',
                    onTap: () {},
                  )
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text("Developed and designed by",
                  style: TextStyle(letterSpacing: 3)),
              SizedBox(height: 8,),
              Text(
                "Horizons App Team",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 9,),
            ],
          ),
        ],
      ),
    );
  }
}
