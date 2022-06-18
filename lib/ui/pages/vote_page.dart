import 'package:flutter/material.dart';
import 'package:voting_app_demo/models/responses/voting_model.dart';

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
    return ListView(children: [
      Text(votingModel.name ?? ""),

      Text(votingModel.description ?? ""),
    ]);
  }

  static void open(BuildContext context, {required VotingResponse votingModel}) {
    Navigator.of(context).pushNamed(route, arguments: {"voteModel": votingModel});
  }
}
