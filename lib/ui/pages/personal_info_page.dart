
import 'package:flutter/material.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({ Key? key }) : super(key: key);
static const String route = "/personal_info";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildContent(),
    );
  }

  Widget _buildContent(){return ListView(

    children: [
      
      
    ],
  );}

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
        "Personal Info",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }
}