class InvitationCreateParam {
  final String title;
  final String date;
  final int person;
  final String desc;
  final String wa;
  final int destinationId;
  final int ownerId;

  const InvitationCreateParam({
    required this.title,
    required this.date,
    required this.person,
    required this.desc,
    required this.wa,
    required this.destinationId,
    required this.ownerId,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'depart_date': date,
      'max_team': person,
      'description': desc,
      'group_link': wa,
      'destination_id': destinationId,
      'owner_id': ownerId,
    };
  }

  InvitationCreateParam copyWith({
    String? title,
    String? date,
    int? person,
    String? desc,
    String? wa,
    int? destinationId,
    int? ownerId,
  }) {
    return InvitationCreateParam(
      title: title ?? this.title,
      date: date ?? this.date,
      person: person ?? this.person,
      desc: desc ?? this.desc,
      wa: wa ?? this.wa,
      destinationId: destinationId ?? this.destinationId,
      ownerId: ownerId ?? this.ownerId,
    );
  }
}
