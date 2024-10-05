import 'package:todo_turno/features/business/application/dto/save_item_id_to_mail_request_DTO.dart';
import 'package:todo_turno/features/business/domain/repositories/save_item_repository.dart';

class SaveItemIdToMail {
  final SaveItemRepository repository;

  SaveItemIdToMail(this.repository);

  Future<bool> call({required SaveItemIdToMailRequestDTO saveItemDTO}) async {
    return await repository.saveItemIntoMail(saveItemDTO: saveItemDTO);
  }
}
