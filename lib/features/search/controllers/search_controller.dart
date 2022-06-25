import 'package:travelmate/dependencies/dependencies.dart';

import '../../../models/models.dart';
import '../../../network/network.dart';

class SearchController extends GetxController {
  var allDestinations = <DestinationMdl>[].obs;
  var query = ''.obs;
  var results = <DestinationMdl>[].obs;
  var isLoading = false.obs;

  bool get isInSearchMode => allDestinations.isNotEmpty && query.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    loadDestinations();
  }

  Future<void> loadDestinations() async {
    try {
      isLoading.value = true;
      final response = await Api().dio.get('destinations');
      GetDestinationsResponse resDestination = GetDestinationsResponse.fromMap(
        response.data,
      );
      allDestinations.value = RxList.from(resDestination.destinations);
    } on DioError catch (e) {
      Get.snackbar('Error!', e.toString());
    }
    isLoading.value = false;
  }

  void changeQuery(String newQuery) {
    query.value = newQuery;
    var tempResult = <DestinationMdl>[];
    if (newQuery.isEmpty) {
      results = RxList.empty();
      return;
    }
    for (final destination in allDestinations) {
      if (destination.name?.toLowerCase().contains(newQuery.toLowerCase()) ??
          false) {
        tempResult.add(destination);
      }
    }
    results = RxList.from(tempResult);
  }
}
