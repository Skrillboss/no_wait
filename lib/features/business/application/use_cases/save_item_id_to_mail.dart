import 'package:todo_turno/features/business/domain/repositories/save_item_repository.dart';

class SaveItemIdToMail {
  final SaveItemRepository repository;

  SaveItemIdToMail(this.repository);

  Future<bool> call({required String businessId, required String itemId}) async {
    return await repository.saveItemIntoMail(businessId: businessId, itemId: itemId);
  }
}
