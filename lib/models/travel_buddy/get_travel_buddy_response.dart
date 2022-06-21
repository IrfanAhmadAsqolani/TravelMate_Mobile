

import 'package:travelmate/models/models.dart';

import '../../dependencies/dependencies.dart';

class GetTravelBuddiesResponse extends Equatable {
  final List<TravelBuddyMdl> travelBuddies;

  const GetTravelBuddiesResponse({
    required this.travelBuddies,
  });

  GetTravelBuddiesResponse copyWith({
    List<TravelBuddyMdl>? travelBuddies,
  }) {
    return GetTravelBuddiesResponse(
      travelBuddies: travelBuddies ?? this.travelBuddies,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'travelBuddies': travelBuddies.map((x) => x.toMap()).toList(),
    };
  }

  factory GetTravelBuddiesResponse.fromMap(List<dynamic> listMap) {
    List<TravelBuddyMdl> travelBuddyList = [];
    for (Map<String, dynamic> eachMap in listMap) {
      travelBuddyList.add(TravelBuddyMdl.fromMap(eachMap));
    }

    return GetTravelBuddiesResponse(
      travelBuddies: travelBuddyList,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [travelBuddies];
}