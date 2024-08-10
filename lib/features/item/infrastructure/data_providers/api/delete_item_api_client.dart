import 'package:http/http.dart' as http;
import 'package:todo_turno/core/request_handler/request_handler.dart';

class DeleteItemApiClient {
  final RequestHandler requestHandler = RequestHandler();
  final http.Client httpClient;

  DeleteItemApiClient({required this.httpClient});

  Future<void> deleteItem(String itemId) async {
    await requestHandler.deleteRequest(
      endPoint: '/deleteItem',
      dataDecode: {
        'itemId': itemId,
      },
      errorCode: 2000
    );
  }
}
