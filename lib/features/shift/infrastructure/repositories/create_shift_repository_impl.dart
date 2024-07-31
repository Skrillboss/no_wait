import 'package:todo_turno/features/shift/domain/entities/shift.dart';
import 'package:todo_turno/features/shift/infrastructure/mappers/shift_mapper.dart';
import '../../domain/repositories/create_shift_repository.dart';
import '../data_providers/demo/create_shift_demo_client.dart';

class CreateShiftRepositoryImpl implements CreateShiftRepository{
  final CreateShiftDemoClient apiClient;

  CreateShiftRepositoryImpl({required this.apiClient});

  @override
  Future<Shift> create(String userId, String itemId, String token) async {
    final Map<String, dynamic> data = await apiClient.createShift(userId, itemId, token);
    final Shift shift = ShiftMapper.fromJson(data['shift']);
    return shift;
  }

}