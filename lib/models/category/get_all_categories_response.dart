import 'package:travelmate/models/models.dart';

import '../../../dependencies/dependencies.dart';

class GetAllCategoriesResponse extends Equatable {
  final List<CategoryMdl> categories;

  const GetAllCategoriesResponse({
    required this.categories,
  });

  GetAllCategoriesResponse copyWith({
    List<CategoryMdl>? categories,
  }) {
    return GetAllCategoriesResponse(
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categories': categories.map((x) => x.toMap()).toList(),
    };
  }

  factory GetAllCategoriesResponse.fromMap(
    List<dynamic> listMap,
  ) {
    List<CategoryMdl> invitations = [];
    for (Map<String, dynamic> eachMap in listMap) {
      invitations.add(CategoryMdl.fromMap(eachMap));
    }

    return GetAllCategoriesResponse(
      categories: invitations,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [categories];
}
