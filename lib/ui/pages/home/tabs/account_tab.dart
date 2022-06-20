import 'package:flutter/material.dart';
import 'package:voting_app_demo/ui/pages/personal_info_page.dart';
import 'package:voting_app_demo/ui/pages/settings_page.dart';
import 'package:voting_app_demo/ui/widgets/listtiles/settings_tile.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({Key? key}) : super(key: key);
  static final String route = "/account_tab";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContent(context),
    );
  }

  _buildAppBar() {
    return PreferredSize(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 50, left: 18, right: 20, bottom: 12),
        child: Center(
          child: Text(
            "My Account",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      preferredSize: Size.fromHeight(kToolbarHeight),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
    Navigator.of(context, rootNavigator: true).pushNamed(PersonalInfoPage.route);
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 2,
            ),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blue[700],
                  child: Text("CS"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "JAFARLI SEVAR ELMAN QIZI",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "123ABC4",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 32,
        ),
        SettingsTile(
          text: "Settings",
         prefixWidget: Icons.settings_outlined,
          onTap: (){
             Navigator.of(context, rootNavigator: true).pushNamed(SettingsPage.route);
          },
        ),
        SettingsTile(text: "Contact", prefixWidget: Icons.phone_outlined),
        SettingsTile(
          text: "FAQ",
          prefixWidget: Icons.question_answer_outlined,
        ),
        SettingsTile(
          text: "Language",
          prefixWidget: Icons.language_outlined,
        ),
        SizedBox(
          height: 30,
        ),
        SettingsTile(
          text: "Logout",
          color: Colors.red,
          prefixWidget: Icons.logout_outlined,
        ),
      ],
    );
  }
}
