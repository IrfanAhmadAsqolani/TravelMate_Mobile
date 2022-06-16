import 'package:travelmate/models/models.dart';

import '../../../dependencies/dependencies.dart';

class GetAllInvitationsResponse extends Equatable {
  final List<InvitationMdl> allInvitations;

  const GetAllInvitationsResponse({
    required this.allInvitations,
  });

  GetAllInvitationsResponse copyWith({
    List<InvitationMdl>? allInvitations,
  }) {
    return GetAllInvitationsResponse(
      allInvitations: allInvitations ?? this.allInvitations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allInvitations': allInvitations.map((x) => x.toMap()).toList(),
    };
  }

  factory GetAllInvitationsResponse.fromMap(
    List<dynamic> listMap,
  ) {
    List<InvitationMdl> invitations = [];
    for (Map<String, dynamic> eachMap in listMap) {
      invitations.add(InvitationMdl.fromMap(eachMap));
    }

    return GetAllInvitationsResponse(
      allInvitations: invitations,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [allInvitations];
}
