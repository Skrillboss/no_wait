abstract class DeleteItemRepository {
  Future<void> delete(String itemId, String token);
}