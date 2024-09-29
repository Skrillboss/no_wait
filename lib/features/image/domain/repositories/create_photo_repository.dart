import 'dart:io';

import '../entities/image_data.dart';

abstract class CreatePhotoRepository {
  Future<ImageData> create(File fileImage);
}