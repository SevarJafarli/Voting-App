import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting_app_demo/ui/widgets/listtiles/settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String route = "/settings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildContent(),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      // padding: EdgeInsets.only(top: 50, left: 18, right: 20, bottom: 12),
      leading: GestureDetector(
          onTap: () {
            Navigator.maybePop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.black)),
      title: Text(
        "Settings",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        SizedBox(
          height: 32,
        ),
        SettingsTile(
          text: "Change password",
          prefixWidget: Icons.lock_rounded,
          onTap: () {},
        ),
        SettingsTile(
          text: "Enable Face ID",
          prefixWidget: CupertinoIcons.person,
          suffixWidget: Switch(
            value: true,
            onChanged: (val) {
              
            },
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
