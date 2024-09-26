import '../../domain/entities/shift.dart';
import '../../domain/repositories/create_shift_repository.dart';

class CreateShift{
  final CreateShiftRepository repository;

  CreateShift(this.repository);

  Future<Shift> call({required String itemId, required int peopleInShift}) async {
    return await repository.create(itemId, peopleInShift);
  }
}