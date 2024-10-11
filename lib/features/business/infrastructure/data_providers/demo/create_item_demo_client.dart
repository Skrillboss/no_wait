import 'package:todo_turno/features/business/infrastructure/data_providers/repositories/create_item_client_repository.dart';

import '../../../../item/application/dto/item_request_DTO.dart';

class CreateItemDemoClient extends CreateItemClientRepository {
  @override
  Future<Map<String, dynamic>> createItem(
      String businessId, ItemRequestDTO itemRequestDTO) async {
    final Map<String, dynamic> response = {
      'businessId': businessId,
      'itemResponseDTO': {
        'id': '3',
        'name': itemRequestDTO.name,
        'description': itemRequestDTO.description,
        'numberPeopleWaiting': 0,
        'peoplePerShift': itemRequestDTO.peoplePerShift,
        'numberShiftsWaiting': 0,
        'rating': 0.0,
        'mainImagePath': itemRequestDTO.mainImagePath,
        'secondaryImagePath':
        itemRequestDTO.secondaryImagePath,
        'currentWaitingDuration': 0.0,
        'durationPerShifts':
        itemRequestDTO.durationPerShifts,
        'status': itemRequestDTO.status,
        'shifts': null
      }
    };
    await Future.delayed(const Duration(seconds: 1));
    return response;
  }
}
