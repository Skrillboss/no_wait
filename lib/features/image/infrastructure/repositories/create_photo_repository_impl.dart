import 'dart:convert';
import 'dart:io';
import 'package:todo_turno/features/image/domain/entities/image_data.dart';
import 'package:todo_turno/features/image/domain/repositories/create_photo_repository.dart';

import '../data_providers/repositories/create_photo_client_repository.dart';
import '../mappers/image_data_mapper.dart';

class CreatePhotoRepositoryImpl extends CreatePhotoRepository{
  final CreatePhotoClientRepository apiClient;

  CreatePhotoRepositoryImpl({required this.apiClient});

  @override
  Future<ImageData> create(File fileImage) async{
    List<int> imageBytes = await fileImage.readAsBytes();
    String imageBase64 = base64Encode(imageBytes);
    final Map<String, dynamic> data = await apiClient.createPhoto(imageBase64);
    final ImageData imageData = ImageDataMapper.fromJson(data['data']);
    return imageData;
  }
}