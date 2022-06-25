import 'package:travelmate/dependencies/dependencies.dart';

import '../../../network/network.dart';

class FilePickerController extends GetxController with CacheManager {
  final ImagePicker _picker = ImagePicker();
  var imageFile = XFile('').obs;

  Future<void> selectImageAndUploadAsIdentity(bool isCamera) async {
    XFile? image;
    if (isCamera) {
      image = await _picker.pickImage(source: ImageSource.camera);
    } else {
      image = await _picker.pickImage(source: ImageSource.gallery);
    }
    if (image == null) {
      Get.snackbar('Error', 'File can not be accessed.');
      return;
    }
    _uploadImageToIdentity(image: image, imagePath: image.path);
  }

  Future<void> _uploadImageToIdentity({
    required XFile image,
    required String imagePath,
  }) async {
    final userId = getUserData()?.id;

    String fileName = imagePath.split('/').last;

    FormData data = FormData.fromMap({
      'identity_pict_image': await MultipartFile.fromFile(
        imagePath,
        filename: fileName,
      ),
      '_method': 'PATCH',
    });

    Api().dio.post('/users/$userId', data: data).then(
      (response) {
        imageFile.value = image;
      },
    ).catchError(
      (error) => print(error),
    );
  }
}
