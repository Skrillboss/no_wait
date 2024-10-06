import 'package:todo_turno/features/business/application/dto/save_item_id_to_mail_request_DTO.dart';
import 'package:todo_turno/features/business/infrastructure/data_providers/repositories/save_item_client_repository.dart';

class SaveItemDemoClient extends SaveItemClientRepository{
  @override
  Future<bool> saveItemIntoMail({required SaveItemIdToMailRequestDTO saveItemDTO}) async{
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}