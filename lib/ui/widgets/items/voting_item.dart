import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:voting_app_demo/models/responses/voting_model.dart';
import 'package:voting_app_demo/ui/pages/vote_page.dart';

class VotingItem extends StatelessWidget {
  const VotingItem({Key? key, required this.votingModel}) : super(key: key);
  final VotingResponse votingModel;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) => Container(),
                  height: 140,
                  width: 240,
                  fit: BoxFit.cover,
                  imageUrl: votingModel.imageUrl ?? "",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(votingModel.name ?? "", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: () {
                      VotePage.open(context, votingModel: votingModel);
                    },
                    child: Container(
                      height: 50,
                      width: 220,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent[700],
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(
                              0.15,
                            ),
                            offset: Offset(0, 3),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                          child: Text(
                        "Vote Now",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
