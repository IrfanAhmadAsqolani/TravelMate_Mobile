import '../../constants/constants.dart';
import '../../dependencies/dependencies.dart';
import '../models.dart';

class DestinationMdl extends Equatable {
  final int? id;
  final int? provinceId;
  final String? name;
  final String? imgUrl;
  final String? desc;
  final int? categoryId;
  final CategoryMdl? category;
  final ProvinceMdl? province;
  final int? invitationsCount;

  const DestinationMdl({
    this.id,
    this.provinceId,
    this.name,
    this.imgUrl,
    this.desc,
    this.categoryId,
    this.category,
    this.province,
    this.invitationsCount,
  });

  String get imageUrl =>
      '${CommonConstant.networkImageBaseUrl}destinations/$imgUrl';

  DestinationMdl copyWith({
    int? id,
    int? provinceId,
    String? name,
    String? imgUrl,
    String? desc,
    int? categoryId,
    CategoryMdl? category,
    ProvinceMdl? province,
    int? invitationsCount,
  }) {
    return DestinationMdl(
      id: id ?? this.id,
      provinceId: provinceId ?? this.provinceId,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      desc: desc ?? this.desc,
      categoryId: categoryId ?? this.categoryId,
      category: category ?? this.category,
      province: province ?? this.province,
      invitationsCount: invitationsCount ?? this.invitationsCount,
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
      'category': category,
      'province': province,
      'invitation_count': invitationsCount,
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
      category:
          map['category'] != null ? CategoryMdl.fromMap(map['category']) : null,
      province:
          map['province'] != null ? ProvinceMdl.fromMap(map['province']) : null,
      invitationsCount: map['invitations_count'],
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      provinceId,
      name,
      imgUrl,
      desc,
      categoryId,
      category,
      province,
      invitationsCount,
    ];
  }
}
