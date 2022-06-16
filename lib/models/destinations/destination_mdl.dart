import '../../dependencies/dependencies.dart';

class DestinationMdl extends Equatable {
  final int id;
  final int provinceId;
  final String name;
  final String imgUrl;
  final String desc;
  final int categoryId;

  const DestinationMdl({
    required this.id,
    required this.provinceId,
    required this.name,
    required this.imgUrl,
    required this.desc,
    required this.categoryId,
  });

  String get imageUrl =>
      'http://travelmate.masuk.id/storage/app/public/destinations/$imgUrl';

  DestinationMdl copyWith({
    int? id,
    int? provinceId,
    String? name,
    String? imgUrl,
    String? desc,
    int? categoryId,
  }) {
    return DestinationMdl(
      id: id ?? this.id,
      provinceId: provinceId ?? this.provinceId,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      desc: desc ?? this.desc,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'provinceId': provinceId,
      'name': name,
      'imgUrl': imgUrl,
      'desc': desc,
      'categoryId': categoryId,
    };
  }

  factory DestinationMdl.fromMap(Map<String, dynamic> map) {
    return DestinationMdl(
      id: map['id'],
      provinceId: map['province_id'],
      name: map['name'],
      imgUrl: map['img_url'],
      desc: map['desc'],
      categoryId: map['category_id'],
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      provinceId,
      name,
      imgUrl,
      desc,
      categoryId,
    ];
  }
}
