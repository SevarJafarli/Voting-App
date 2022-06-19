import 'package:flutter/material.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({Key? key}) : super(key: key);
  static final String route = "/account_tab";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContent(),
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

  Widget _buildContent() {
    return Column(children: [
      Container(
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
      SizedBox(
        height: 24,
      ),
      Container(
          margin: EdgeInsets.only(top: 2, bottom: 2),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              Icon(Icons.settings_outlined, color: Colors.grey[500], size: 28),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text("Settings", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ],
          )),
      Container(
          margin: EdgeInsets.only(top: 2, bottom: 2),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              Icon(Icons.settings_outlined, color: Colors.grey[500], size: 28),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text("Settings", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ],
          )),
      Container(
          margin: EdgeInsets.only(top: 32, bottom: 2),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              Icon(Icons.logout_outlined, color: Colors.red[600], size: 28),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text("Logout", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.red[600])),
              ),
            ],
          ))
    ]);
  }
}
