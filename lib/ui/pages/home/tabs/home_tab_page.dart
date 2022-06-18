import 'package:flutter/material.dart';
import 'package:voting_app_demo/ui/widgets/blocks/active_votings_block.dart';
import 'package:voting_app_demo/ui/widgets/blocks/popular_votings_block.dart';

class HomeTabPage extends StatelessWidget {
  static final String route = "/home_tab";
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  _buildAppBar() {
    return PreferredSize(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 50, left: 18, right: 20, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Home",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Icon(Icons.notifications_rounded, color: Colors.blue[700], size: 28),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: CircleAvatar(
                    radius: 18.0,
                    backgroundImage: NetworkImage('https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?auto=compress&cs=tinysrgb&w=800'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(
        kToolbarHeight * 2,
      ),
    );
  }

  Widget _buildContent() {
    return ListView(
      children: [
        SizedBox(
          height: 12,
        ),
        TopCategoriesBlock(),
        PopularVotingsBlock(),
          SizedBox(
          height: 16,
        ),
        ActiveVotingsBlock(),
      ],
    );
  }
}
