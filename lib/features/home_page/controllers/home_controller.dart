import 'package:travelmate/dependencies/dependencies.dart';

import '../../../models/models.dart';
import '../../../network/network.dart';

class HomeController extends GetxController {
  var popularDestinations = <DestinationMdl>[].obs;
  var recommendedDestinations = <DestinationMdl>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    getPopularDestinations();
    getRecommendedDestinations();
  }

  Future<void> getPopularDestinations() async {
    try {
      isLoading.value = true;
      final response = await Api().dio.get('destinations');
      GetDestinationsResponse resDestination = GetDestinationsResponse.fromMap(
        response.data,
      );
      popularDestinations.value = RxList.from(resDestination.destinations);
      isLoading.value = false;
    } on DioError catch (e) {
      Get.snackbar('Error!', e.toString());
    }
  }

  // TODO(adityandar): change to recommended places logic
  Future<void> getRecommendedDestinations() async {
    try {
      isLoading.value = true;
      final response = await Api().dio.get('destinations');
      GetDestinationsResponse resDestination = GetDestinationsResponse.fromMap(
        response.data,
      );
      recommendedDestinations.value = RxList.from(resDestination.destinations);
      isLoading.value = false;
    } on DioError catch (e) {
      Get.snackbar('Error!', e.toString());
    }
  }
}
