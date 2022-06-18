import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:voting_app_demo/models/responses/contestant_response.dart';
import 'package:voting_app_demo/models/responses/voting_model.dart';
import 'package:voting_app_demo/ui/widgets/items/voting_item.dart';

class PopularVotingsBlock extends StatelessWidget {
  const PopularVotingsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var fakeJson = '''[
      {
        "name": "Voting 1",
        "description": "Des 1",
        "imageUrl": "https://images.pexels.com/photos/1550340/pexels-photo-1550340.jpeg?auto=compress&cs=tinysrgb&w=800",
        "contestants": [
          {"name": "Contestant 1", "event": "Event", "numOfVotes": 1},
          {"name": "Contestant 2", "event": "Event 2", "numOfVotes": 2}
        ]
      },
      {
        "name": "Voting 1",
        "description": "Des 1",
        "imageUrl": "https://images.pexels.com/photos/1550340/pexels-photo-1550340.jpeg?auto=compress&cs=tinysrgb&w=800",
        "contestants": [
          {"name": "Contestant 1", "event": "Event", "numOfVotes": 1},
          {"name": "Contestant 2", "event": "Event 2", "numOfVotes": 2}
        ]
      }
    ]''';

    List<VotingResponse> popularVotings= List<VotingResponse>.from(json.decode(fakeJson).map((x) => VotingResponse.fromJson(x)));
    return Container(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Now",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "SEE ALL",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 260,
          child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12),
              itemCount: popularVotings.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return VotingItem(votingModel: popularVotings[index]);
              }),
        )
      ],
    ));
  }
}
