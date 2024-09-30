import 'dart:io';

import '../../domain/entities/image_data.dart';
import '../../domain/repositories/create_photo_repository.dart';

class CreatePhoto {
  final CreatePhotoRepository repository;

  CreatePhoto(this.repository);

  Future<ImageData> call({required File fileImage}) async {
    return await repository.create(fileImage);
  }
}
