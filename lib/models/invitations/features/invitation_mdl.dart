import '../../../dependencies/dependencies.dart';

class InvitationMdl extends Equatable {
  final int id;
  final int destinationId;
  final int ownerId;
  final int maxTeam;
  final String title;
  final String description;
  final String groupUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const InvitationMdl({
    required this.id,
    required this.destinationId,
    required this.ownerId,
    required this.maxTeam,
    required this.title,
    required this.description,
    required this.groupUrl,
    required this.createdAt,
    required this.updatedAt,
  });

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
    ];
  }
}
