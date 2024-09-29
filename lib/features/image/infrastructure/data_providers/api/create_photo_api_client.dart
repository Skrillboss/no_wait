import 'dart:convert';
import 'package:todo_turno/core/request_handler/request_handler.dart';
import 'package:todo_turno/features/image/infrastructure/data_providers/repositories/create_photo_client_repository.dart';
import '../../../../../core/custom_exception/custom_exception.dart';

class CreatePhotoApiClient extends CreatePhotoClientRepository{
  final RequestHandler requestHandler = RequestHandler();

  @override
  Future<Map<String, dynamic>> createPhoto(String base64Image) async{
    try {
      final response = await requestHandler.postRequest(
          baseApiUrl: 'https://api.imgbb.com',
          endPoint: '/1/upload',
          dataDecode: {
            'key': '54c31e3b14a8d003af8d1dddd74ffc26',
            'image': base64Image
          },
          errorCode: 2000,
          isFormData: true,
          useToken: false);
      return jsonDecode(response.body);
    } on CustomException {
      rethrow;
    }
  }
}