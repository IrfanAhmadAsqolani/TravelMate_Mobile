import 'package:travelmate/models/models.dart';

import '../../../network/network.dart';

abstract class DestinationDetailRepository {
  Future<GetAllInvitationsResponse> getAllInvitations();
}

class DestinationDetailRepositoryImpl extends DestinationDetailRepository {
  @override
  Future<GetAllInvitationsResponse> getAllInvitations() async {
    var response = await Api().dio.get('invitations');

    return GetAllInvitationsResponse.fromMap(response.data);
  }
}
