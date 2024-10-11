
abstract class SaveItemClientRepository {
  Future<bool> saveItemIntoMail({required String businessId, required String itemId});
}