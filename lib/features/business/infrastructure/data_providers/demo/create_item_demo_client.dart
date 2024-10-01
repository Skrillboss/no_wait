import 'package:todo_turno/features/business/application/dto/add_item_request_DTO.dart';
import 'package:todo_turno/features/business/infrastructure/data_providers/repositories/create_item_client_repository.dart';

class CreateItemDemoClient extends CreateItemClientRepository {
  @override
  Future<Map<String, dynamic>> createItem(
      AddItemRequestDTO addItemRequestDTO) async {
    final Map<String, dynamic> response = {
      'businessId': '1',
      'itemResponseDTO': {
        'id': '3',
        'name': addItemRequestDTO.createItemRequestDTO.name,
        'description': addItemRequestDTO.createItemRequestDTO.description,
        'numberPeopleWaiting': 0,
        'peoplePerShift': addItemRequestDTO.createItemRequestDTO.peoplePerShift,
        'numberShiftsWaiting': 0,
        'rating': 0.0,
        'mainImagePath': addItemRequestDTO.createItemRequestDTO.mainImagePath,
        'secondaryImagePath':
        addItemRequestDTO.createItemRequestDTO.secondaryImagePath,
        'currentWaitingDuration': 0.0,
        'durationPerShifts':
        addItemRequestDTO.createItemRequestDTO.durationPerShifts,
        'status': addItemRequestDTO.createItemRequestDTO.status,
        'shifts': null
      }
    };
    await Future.delayed(const Duration(seconds: 1));
    return response;
  }
}
