import 'package:todo_turno/features/business/application/dto/save_item_id_to_mail_request_DTO.dart';

import '../../domain/repositories/save_item_repository.dart';
import '../data_providers/repositories/save_item_client_repository.dart';

class SaveItemRepositoryImpl extends SaveItemRepository{
  final SaveItemClientRepository apiClient;

  SaveItemRepositoryImpl({required this.apiClient});

  @override
  Future<bool> saveItemIntoMail({required SaveItemIdToMailRequestDTO saveItemDTO}) async{
    return await apiClient.saveItemIntoMail(saveItemDTO: saveItemDTO);
  }
}