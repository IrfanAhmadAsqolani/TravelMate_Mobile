import '../../dependencies/dependencies.dart';

class ProvinceMdl extends Equatable {
  final int? id;
  final String? name;

  const ProvinceMdl({
    this.id,
    this.name,
  });

  ProvinceMdl copyWith({
    int? id,
    String? name,
  }) {
    return ProvinceMdl(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory ProvinceMdl.fromMap(Map<String, dynamic> map) {
    return ProvinceMdl(
      id: map['id'],
      name: map['name'],
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name];
}
