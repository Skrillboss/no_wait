import 'package:todo_turno/features/user/domain/entities/user.dart';
import '../entities/shift.dart';

abstract class ReadShiftsRepository{
  Future<List<Shift>> read(User user, String token);
}