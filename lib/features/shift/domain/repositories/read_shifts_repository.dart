import '../entities/shift.dart';

abstract class ReadShiftsRepository{
  Future<List<Shift>> read(String userId, String token);
}