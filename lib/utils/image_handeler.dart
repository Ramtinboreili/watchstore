import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHandeler {
  File? _image;

  Future<void> pickAndCroppImg({required ImageSource source}) async {
    try {
          final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    File? img = File(image.path);
    img = await _croppedImage(imageFile: img);
    _image = img;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<File?> _croppedImage ({required File imageFile})async{
    CroppedFile? crppedImage = await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (crppedImage == null) {
      return null ;
    }
    return File(crppedImage.path);
  }

  File? get getImage => _image;
}
