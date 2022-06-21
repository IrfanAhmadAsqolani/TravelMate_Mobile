


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

  const TravelBuddyMdl({
    required this.id,
    required this.invitationId,
    required this.memberId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.invitation,
    required this.user,
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
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props{ 
    return [
      id, 
      invitationId, 
      memberId, 
      status, 
      createdAt, 
      updatedAt,
      invitation,
      user,
    ];
  }
}