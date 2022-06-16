import 'package:travelmate/models/models.dart';

import '../../../network/network.dart';

abstract class DestinationDetailRepository {
  Future<GetAllInvitationsResponse> getAllInvitations();
  Future<void> createInvitation(CreateInvitationParam param);
}

class DestinationDetailRepositoryImpl extends DestinationDetailRepository {
  @override
  Future<GetAllInvitationsResponse> getAllInvitations() async {
    var response = await Api().dio.get('invitations');

    return GetAllInvitationsResponse.fromMap(response.data);
  }

  @override
  Future<void> createInvitation(CreateInvitationParam param) async {
    await Api().dio.post(
          'travel_buddies',
          data: param.toMap(),
        );
  }
}
