import '../../../dependencies/dependencies.dart';
import '../../../helpers/helpers.dart';
import '../../models.dart';

class InvitationMdl extends Equatable {
  final int? id;
  final int? destinationId;
  final int? ownerId;
  final int? maxTeam;
  final String? title;
  final String? description;
  final String? groupUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? departDate;
  final UserMdl? owner;
  final DestinationMdl? destination;
  final int? approvedBuddies;

  const InvitationMdl({
    this.id,
    this.destinationId,
    this.ownerId,
    this.maxTeam,
    this.title,
    this.description,
    this.groupUrl,
    this.createdAt,
    this.updatedAt,
    this.departDate,
    this.owner,
    this.destination,
    this.approvedBuddies,
  });

  bool get isOpen => DateHelper.isBeforeToday(departDate) && isSlotAvailable;

  bool get isSlotAvailable => (approvedBuddies ?? 0) < (maxTeam ?? 0);

  int? get slotAvailable {
    if (maxTeam != null && approvedBuddies != null) {
      if (approvedBuddies! < maxTeam!) {
        return maxTeam! - approvedBuddies!;
      }
    }
    return null;
  }

  InvitationMdl copyWith({
    int? id,
    int? destinationId,
    int? ownerId,
    int? maxTeam,
    String? title,
    String? description,
    String? groupUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? departDate,
    UserMdl? owner,
    DestinationMdl? destination,
    int? approvedBuddies,
  }) {
    return InvitationMdl(
      id: id ?? this.id,
      destinationId: destinationId ?? this.destinationId,
      ownerId: ownerId ?? this.ownerId,
      maxTeam: maxTeam ?? this.maxTeam,
      title: title ?? this.title,
      description: description ?? this.description,
      groupUrl: groupUrl ?? this.groupUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      owner: owner ?? this.owner,
      destination: destination ?? this.destination,
      departDate: departDate ?? this.departDate,
      approvedBuddies: approvedBuddies ?? this.approvedBuddies,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'destinationId': destinationId,
      'ownerId': ownerId,
      'maxTeam': maxTeam,
      'title': title,
      'description': description,
      'groupUrl': groupUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'departDate': departDate,
      'owner': owner?.toMap(),
      'destination': destination?.toMap(),
      'approved_buddies': approvedBuddies,
    };
  }

  factory InvitationMdl.fromMap(Map<String, dynamic> map) {
    return InvitationMdl(
      id: map['id'],
      destinationId: map['destination_id'],
      ownerId: map['owner_id'],
      maxTeam: map['max_team'],
      title: map['title'],
      description: map['description'],
      groupUrl: map['group_link'],
      createdAt: DateTime.tryParse(map['created_at']),
      updatedAt: DateTime.tryParse(map['updated_at']),
      departDate: DateTime.tryParse(map['depart_date']),
      owner: (map['owner'] != null) ? UserMdl.fromMap(map['owner']) : null,
      destination: (map['destination'] != null)
          ? DestinationMdl.fromMap(map['destination'])
          : null,
      approvedBuddies: map['approved_buddies'],
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      ownerId,
      maxTeam,
      title,
      description,
      groupUrl,
      createdAt,
      updatedAt,
      departDate,
      owner,
      destination,
      approvedBuddies,
    ];
  }
}
