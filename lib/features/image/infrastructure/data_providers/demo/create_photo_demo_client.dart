import 'package:todo_turno/features/image/infrastructure/data_providers/repositories/create_photo_client_repository.dart';

class CreatePhotoDemoClient extends CreatePhotoClientRepository {
  @override
  Future<Map<String, dynamic>> createPhoto(String base64Image) async {
    return {
      'data': {
        'url_viewer': 'https://ibb.co/GJpVLYr',
        'display_url': 'https://i.ibb.co/SxyK8YZ/c4b06a7a8c01.jpg',
        'delete_url': 'https://ibb.co/GJpVLYr/18a553143fea4e0abd4dc4c74f2bd6a5'
      }
    };
  }
}
