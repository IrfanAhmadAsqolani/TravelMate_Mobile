import '../../../dependencies/dependencies.dart';

class CreateInvitationParam extends Equatable {
  final int memberId;
  final int invitationId;
  final int status;
  final String message;

  const CreateInvitationParam({
    required this.memberId,
    required this.invitationId,
    required this.message,
  }) : status = 0;

  CreateInvitationParam copyWith({
    int? memberId,
    int? invitationId,
    String? message,
  }) {
    return CreateInvitationParam(
      memberId: memberId ?? this.memberId,
      invitationId: invitationId ?? this.invitationId,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'member_id': memberId,
      'invitation_id': invitationId,
      'status': status,
      'message': message,
    };
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [memberId, invitationId, status, message];
}
