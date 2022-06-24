class CreateTravelBuddyParam {
  final int memberId;
  final int invitationId;
  final int status;
  final String message;
  

  const CreateTravelBuddyParam({
    required this.memberId,
    required this.invitationId,
    required this.status,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'member_id' : memberId,
      'invitation_id' : invitationId,
      'status' : status,
      'message' : message,
    };
  }

  CreateTravelBuddyParam copyWith({
    int? memberId,
    int? invitationId,
    int? status,
    String? message,
  }) {
    return CreateTravelBuddyParam(
      memberId: memberId ?? this.memberId,
      invitationId: invitationId ?? this.invitationId,
      status: status ?? this.status,
      message: message ?? this.message,
      
    );
  }
}
