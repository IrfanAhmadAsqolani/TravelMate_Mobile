import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/enums/verification_status.dart';
import 'package:travelmate/helpers/auth_helper.dart';

import '../../../models/models.dart';
import '../../../network/network.dart';

class HomeController extends GetxController with CacheManager {
  var popularDestinations = <DestinationMdl>[].obs;
  var recommendedDestinations = <DestinationMdl>[].obs;
  var verificationStatus = VerificationStatus.verified.obs;
  var isLoading = false.obs;
  final isInterestsEmpty = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    getPopularDestinations();
    getRecommendedDestinations();
    getUserVerifiedStatus();
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

  Future<void> getRecommendedDestinations() async {
    final user = getUserData();
    if (user != null) {
      if (user.isInterestEmpty) {
        isInterestsEmpty.value = true;
        return;
      }

      try {
        isLoading.value = true;
        final response = await Api().dio.get('destinations');
        GetDestinationsResponse resDestination =
            GetDestinationsResponse.fromMap(
          response.data,
        );
        List<DestinationMdl> temporaryDestination = [];
        for (DestinationMdl destination in resDestination.destinations) {
          if (user.interests?.contains(destination.category?.id.toString()) ??
              false) {
            temporaryDestination.add(destination);
          }
        }
        recommendedDestinations.value = RxList.from(temporaryDestination);
        isLoading.value = false;
      } on DioError catch (e) {
        Get.snackbar('Error!', e.toString());
      }
    }
  }

  Future<void> getUserVerifiedStatus() async {
    await AuthHelper().getMyUserDataAndSaveToLocal();
    final user = getUserData();
    verificationStatus.value =
        user?.verificationStatus ?? VerificationStatus.pending;
  }
}
