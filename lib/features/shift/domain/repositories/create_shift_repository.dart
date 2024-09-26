import '../entities/shift.dart';

abstract class CreateShiftRepository{
  Future<Shift> create(String itemId, int peopleInShift);
}