import 'dart:convert';

import 'package:http/http.dart';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import 'package:todo_turno/core/request_handler/request_handler.dart';
import 'package:todo_turno/features/business/application/dto/save_item_id_to_mail_request_DTO.dart';
import 'package:todo_turno/features/business/infrastructure/data_providers/repositories/save_item_client_repository.dart';

class SaveItemApiClient extends SaveItemClientRepository {
  final RequestHandler requestHandler = RequestHandler();

  @override
  Future<bool> saveItemIntoMail(
      {required SaveItemIdToMailRequestDTO saveItemDTO}) async {
    try {
      final Response response = await requestHandler.postRequest(
          endPoint: '/business/item/saveQR/mail',
          dataDecode: saveItemDTO.toJson(),
          errorCode: 2000);
      return jsonDecode(response.body);
    } on CustomException {
      rethrow;
    }
  }
}
