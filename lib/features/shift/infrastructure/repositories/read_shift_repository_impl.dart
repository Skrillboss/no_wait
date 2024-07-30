import 'package:todo_turno/features/shift/domain/entities/shift.dart';
import '../../domain/repositories/read_shifts_repository.dart';
import '../data_providers/demo/read_shifts_demo_client.dart';
import '../mappers/shift_mapper.dart';

class ReadShiftsRepositoryImpl implements ReadShiftsRepository{
  final ReadShiftsDemoClient apiClient;

  ReadShiftsRepositoryImpl({required this.apiClient});

  @override
  Future<List<Shift>> read(String userId, String token) async {
    final Map<String, dynamic> data = await apiClient.getShifts(userId, token);

    final List<dynamic> shiftsList = data['shifts'] as List<dynamic>;

    final List<Shift> shifts = shiftsList.map((shiftJson) {
      return ShiftMapper.fromJson(shiftJson as Map<String, dynamic>);
    }).toList();

    return shifts;
  }
}