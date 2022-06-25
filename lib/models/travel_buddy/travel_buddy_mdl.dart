import '../../dependencies/dependencies.dart';
import '../invitations/features/features.dart';
import '../users/user_mdl.dart';

class TravelBuddyMdl extends Equatable {
  final int? id;
  final int? invitationId;
  final int? memberId;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final InvitationMdl? invitation;
  final UserMdl? user;
  final String? message;

  const TravelBuddyMdl({
     this.id,
     this.invitationId,
     this.memberId,
     this.status,
     this.createdAt,
     this.updatedAt,
     this.invitation,
     this.user,
     this.message,
  });

  TravelBuddyMdl copyWith({
    int? id,
    int? invitationId,
    int? memberId,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    InvitationMdl? invitation,
    UserMdl? user,
    String? message,
  }) {
    return TravelBuddyMdl(
      id: id ?? this.id,
      invitationId: invitationId ?? this.invitationId,
      memberId: memberId ?? this.memberId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      invitation: invitation ?? this.invitation,
      user: user ?? this.user,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'invitation_id': invitationId,
      'member_id': memberId,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'invitation': invitation?.toMap(),
      'user': user?.toMap(),
      'message': message,
    };
  }

  factory TravelBuddyMdl.fromMap(Map<String, dynamic> map) {
    return TravelBuddyMdl(
      id: map['id'],
      invitationId: map['invitation_id'],
      memberId: map['member_id'],
      status: map['status'],
      createdAt: DateTime.tryParse(map['created_at']),
      updatedAt: DateTime.tryParse(map['updated_at']),
      invitation: map['invitation'] != null
          ? InvitationMdl.fromMap(map['invitation'])
          : null,
      user: map['user'] != null ? UserMdl.fromMap(map['user']) : null,
      message: map['message'],
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      invitationId,
      memberId,
      status,
      createdAt,
      updatedAt,
      invitation,
      user,
      message,
    ];
  }
}
