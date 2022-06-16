import '../../dependencies/dependencies.dart';
import '../models.dart';

class GetDestinationsResponse extends Equatable {
  final List<DestinationMdl> destinations;

  const GetDestinationsResponse({
    required this.destinations,
  });

  GetDestinationsResponse copyWith({
    List<DestinationMdl>? destinations,
  }) {
    return GetDestinationsResponse(
      destinations: destinations ?? this.destinations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'destinations': destinations.map((x) => x.toMap()).toList(),
    };
  }

  factory GetDestinationsResponse.fromMap(List<dynamic> listMap) {
    List<DestinationMdl> destinations = [];
    for (Map<String, dynamic> eachMap in listMap) {
      destinations.add(DestinationMdl.fromMap(eachMap));
    }

    return GetDestinationsResponse(
      destinations: destinations,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [destinations];
}
