import '../entities/shift.dart';

abstract class CreateShiftRepository{
  Future<Shift> create(String userId, String itemId, int peopleInShift);
}