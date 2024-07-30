import '../../domain/entities/shift.dart';
import '../../domain/repositories/read_shifts_repository.dart';

class ReadShifts {
  final ReadShiftsRepository repository;

  ReadShifts(this.repository);

  Future<List<Shift>> call({required String userId, required String token}) async {
    return await repository.read(userId, token);
  }
}
