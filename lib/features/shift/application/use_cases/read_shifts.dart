import '../../../user/domain/entities/user.dart';
import '../../domain/entities/shift.dart';
import '../../domain/repositories/read_shifts.dart';

class ReadShifts {
  final ReadShiftsRepository repository;

  ReadShifts(this.repository);

  Future<List<Shift>> call({required User user, required String token}) async {
    return await repository.read(user, token);
  }
}
