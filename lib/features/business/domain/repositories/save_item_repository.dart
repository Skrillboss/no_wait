import '../../application/dto/save_item_id_to_mail_request_DTO.dart';

abstract class SaveItemRepository{
  Future<bool> saveItemIntoMail({required SaveItemIdToMailRequestDTO saveItemDTO});
}