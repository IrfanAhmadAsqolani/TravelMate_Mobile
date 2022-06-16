// class HomeService {
//   static HomeService? _instance;

//   factory HomeService() => _instance ??= HomeService._();

//   HomeService._();

//   Future<GetTermsAndConditionsResponse> getTermsAndConditions() async {
//     var response = await Api().dio.get('about/terms-and-conditions');

//     return GetTermsAndConditionsResponse.fromJson(response.data);
//   }

//   Future<GetPrivacyPolicyResponse> getPrivacyPolicy() async {
//     var response = await Api().dio.get('about/privacy-policy');

//     return GetPrivacyPolicyResponse.fromJson(response.data);
//   }

//   Future<void> giveFeedback(GiveFeedbackRequest request) async {
//     await Api().dio.post('feedback', data: jsonEncode(request.toJson()));
//   }
// }
