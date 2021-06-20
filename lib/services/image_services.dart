import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class ImageService {
  Future<ImageResult> uploadImage({
    required File imageToUpload,
    required String title,
  }) async {
    var imageFileName =
        title + DateTime.now().millisecondsSinceEpoch.toString();

    final firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imageFileName);

    UploadTask uploadTask = firebaseStorageRef.putFile(imageToUpload);

    TaskSnapshot storageSnapshot = await uploadTask;

    var downloadUrl = await storageSnapshot.ref.getDownloadURL();

    var url = downloadUrl.toString();
    return ImageResult(
      imageUrl: url,
      imageFileName: imageFileName,
    );
  }

  Future deleteImage(String imageFileName) async {
    final firebaseStorageRef =
        FirebaseStorage.instance.ref('receita_image/').child(imageFileName);

    try {
      await firebaseStorageRef.delete();
      return true;
    } catch (e) {
      return e.toString();
    }
  }
}

class ImageResult {
  final String imageUrl;
  final String imageFileName;

  ImageResult({required this.imageUrl, required this.imageFileName});
}
