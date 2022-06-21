import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/models/models.dart';

import '../../../network/network.dart';

class OnboardingController extends GetxController with CacheManager {
  OnboardingController();

  var interests = <CategoryMdl>[].obs;
  var selectedInterests = <CategoryMdl>[].obs;
  var isLoadLoading = false.obs;
  var isSubmitLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getInterests();
  }

  Future<void> getInterests() async {
    isLoadLoading.value = true;
    try {
      final response = await Api().dio.get('categories');
      GetAllCategoriesResponse resCategories = GetAllCategoriesResponse.fromMap(
        response.data,
      );
      interests.value = RxList.from(resCategories.categories);
      isLoadLoading.value = false;
    } on DioError catch (e) {
      throw e.toString();
    }
  }

  void selectInterest(CategoryMdl category) {
    if (selectedInterests.contains(category)) {
      selectedInterests.remove(category);
    } else {
      selectedInterests.add(category);
    }
    refresh();
  }

  Future<bool> updateInterestToNetwork() async {
    isSubmitLoading.value = true;
    final UserMdl? user = getUserData();
    if (user == null) {
      return false;
    }
    var selectedInterestsInString = '';
    for (final interest in selectedInterests) {
      if (selectedInterestsInString.isEmpty) {
        selectedInterestsInString = '${interest.id}';
      } else {
        selectedInterestsInString = '$selectedInterestsInString,${interest.id}';
      }
    }
    try {
      await Api().dio.post('users/${user.id}', data: {
        'interests': selectedInterestsInString,
      }, queryParameters: {
        '_method': 'PATCH',
      });
      isSubmitLoading.value = false;
      return true;
    } on DioError catch (e) {
      isSubmitLoading.value = false;
      return false;
    } catch (e) {
      isSubmitLoading.value = false;

      return false;
    }
  }
}
