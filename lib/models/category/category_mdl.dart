import '../../dependencies/dependencies.dart';

class CategoryMdl extends Equatable {
  final int? id;
  final String? name;

  const CategoryMdl({
    this.id,
    this.name,
  });

  CategoryMdl copyWith({
    int? id,
    String? name,
  }) {
    return CategoryMdl(
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

  factory CategoryMdl.fromMap(Map<String, dynamic> map) {
    return CategoryMdl(
      id: map['id'],
      name: map['name'],
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name];
}
