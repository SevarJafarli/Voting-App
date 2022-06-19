import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voting_app_demo/constants/app_colors.dart';
import 'package:voting_app_demo/models/responses/voting_model.dart';
import 'package:voting_app_demo/ui/widgets/buttons/category_button.dart';

class VotePage extends StatelessWidget {
  const VotePage({
    Key? key,
    required this.votingModel,
  }) : super(key: key);
  static const String route = "/vote";
  final VotingResponse votingModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildContent(context),
    );
  }

  PreferredSize _buildAppBar(BuildContext context) {
    return PreferredSize(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 50, left: 18, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).maybePop();
              },
              child: Icon(Icons.arrow_back_ios),
            ),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(
        kToolbarHeight * 2,
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      children: [
        Row(
          children: [
            Icon(
              Icons.people_rounded,
              color: Color(0xFF5A7CFF),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Text(
                "${votingModel.numOfVotes} Voters",
                style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w700, fontSize: 16),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          votingModel.name ?? "",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          votingModel.description ?? "",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              for (var contestant in votingModel.contestants!)
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    contestant.name ?? "",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )),
                )
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Wrap(
            runSpacing: 10,
            spacing: 10,
            children: [
              CategoryButton(
                text: "Category",
                color: (AppColors.randomColors..shuffle()).first,
                hasBorder: true,
              ),
              CategoryButton(
                text: "Category",
                color: (AppColors.randomColors..shuffle()).last,
                hasBorder: true,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue[700]!, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("https://stackoverflow.com"),
              InkWell(
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "https://stackoverflow.com")).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Copied to your clipboard')));
                  });
                },
                child: Row(
                  children: [
                    Text("Copy"),
                    SizedBox(
                      width: 3,
                    ),
                    Icon(Icons.copy_rounded, color: Colors.blue),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  static void open(BuildContext context, {required VotingResponse votingModel}) {
    Navigator.of(context).pushNamed(route, arguments: {"voteModel": votingModel});
  }
}
