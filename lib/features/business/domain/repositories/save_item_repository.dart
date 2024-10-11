
abstract class SaveItemRepository{
  Future<bool> saveItemIntoMail({required String businessId, required String itemId});
}