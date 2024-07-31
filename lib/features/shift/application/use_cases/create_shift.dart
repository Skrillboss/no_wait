import '../../domain/entities/shift.dart';
import '../../domain/repositories/create_shift_repository.dart';

class CreateShift{
  final CreateShiftRepository repository;

  CreateShift(this.repository);

  Future<Shift> call({required String userId, required String itemId, required String token}) async {
    return await repository.create(userId, itemId, token);
  }
}