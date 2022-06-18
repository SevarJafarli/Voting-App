class ContestantResponse{
  final String? name;
  final String? event;
  final int? numOfVotes;

  ContestantResponse({this.name, this.event, this.numOfVotes});
    factory ContestantResponse.fromJson(Map<dynamic, dynamic> json) => ContestantResponse(
        name: json["name"] == null ? null : json["name"],
        event: json["event"] == null ? null : json["event"],
        numOfVotes: json["numOfVotes"] == null ? null : json["numOfVotes"],
      
      );
}