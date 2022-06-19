import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:voting_app_demo/models/responses/contestant_response.dart';
import 'package:voting_app_demo/models/responses/voting_model.dart';
import 'package:voting_app_demo/ui/widgets/blocks/app_block.dart';
import 'package:voting_app_demo/ui/widgets/items/voting_item.dart';

class PopularVotingsBlock extends AppBlock {
  static var _fakeJson = '''[
      {
        "name": "Voting 1 sjsjsjs sjsjsjss sissis ",
        "description": "Des 1",
        "imageUrl": "https://images.pexels.com/photos/1550340/pexels-photo-1550340.jpeg?auto=compress&cs=tinysrgb&w=800",
        "contestants": [
          {"name": "Contestant 1", "event": "Event", "numOfVotes": 1},
          {"name": "Contestant 2", "event": "Event 2", "numOfVotes": 2}
        ], 
        "numOfVotes": 5
      },
      {
        "name": "Voting 1",
        "description": "Des 1",
        "imageUrl": "https://images.pexels.com/photos/1550340/pexels-photo-1550340.jpeg?auto=compress&cs=tinysrgb&w=800",
        "contestants": [
          {"name": "Contestant 1", "event": "Event", "numOfVotes": 1},
          {"name": "Contestant 2", "event": "Event 2", "numOfVotes": 2}
        ],
         "numOfVotes":3
      }
    ]''';

  List<VotingResponse> popularVotings = List<VotingResponse>.from(json.decode(_fakeJson).map((x) => VotingResponse.fromJson(x)));

  @override
  Widget buildContent() {
    return Container(
      height: 282,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 12),
          itemCount: popularVotings.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return VotingItem(votingModel: popularVotings[index]);
          }),
    );
  }

  @override
  void onTap() {
    // TODO: implement onTap
  }

  @override
  String title() {
    return "Popular Now";
  }
}
