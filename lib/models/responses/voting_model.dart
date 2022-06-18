// import 'package:voting_app_demo/models/responses/contestant_response.dart';

// class VotingResponse {
//   final String? name;
//   final String? description;
//   final String? imageUrl;

//   final List<ContestantResponse>? contestants;

//   VotingResponse({this.name, this.description, this.imageUrl, this.contestants});

//   factory VotingResponse.fromJson(Map<String, dynamic> json) => VotingResponse(
//         name: json["name"] == null ? null : json["name"],
//         description: json["description"] == null ? null : json["description"],
//         imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
//         contestants: json["contestants"] == null ? null : List<ContestantResponse>.from(json["contestants"].map((x) => ContestantResponse.fromJson(x))),
//       );
// }


// To parse this JSON data, do
//
//     final votingResponse = votingResponseFromJson(jsonString);


class VotingResponse {
    VotingResponse({
        this.name,
        this.description,
        this.imageUrl,
        this.contestants,
    });

    final String? name;
    final String? description;
    final String? imageUrl;
    final List<Contestant>? contestants;

    factory VotingResponse.fromJson(Map<String, dynamic> json) => VotingResponse(
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        contestants: json["contestants"] == null ? null : List<Contestant>.from(json["contestants"].map((x) => Contestant.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "contestants": contestants == null ? null : List<dynamic>.from(contestants!.map((x) => x.toJson())),
    };
}

class Contestant {
    Contestant({
        this.name,
        this.event,
        this.numOfVotes,
    });

    final String? name;
    final String? event;
    final int? numOfVotes;

    factory Contestant.fromJson(Map<String, dynamic> json) => Contestant(
        name: json["name"] == null ? null : json["name"],
        event: json["event"] == null ? null : json["event"],
        numOfVotes: json["numOfVotes"] == null ? null : json["numOfVotes"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "event": event == null ? null : event,
        "numOfVotes": numOfVotes == null ? null : numOfVotes,
    };
}
