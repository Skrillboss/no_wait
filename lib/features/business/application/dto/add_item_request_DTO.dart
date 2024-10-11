import '../../../item/application/dto/item_request_DTO.dart';

class AddItemRequestDTO {
  final String businessId;
  final ItemRequestDTO createItemRequestDTO;

  AddItemRequestDTO(this.businessId, this.createItemRequestDTO);

  Map<String, dynamic> toJson() {
    return {
      "businessId": businessId,
      "createItemRequestDTO": {
        "name": createItemRequestDTO.name,
        "description": createItemRequestDTO.description,
        "peoplePerShift": createItemRequestDTO.peoplePerShift,
        "mainImagePath": createItemRequestDTO.mainImagePath,
        "secondaryImagePath": createItemRequestDTO.secondaryImagePath,
        "durationPerShifts": createItemRequestDTO.durationPerShifts,
        "status": createItemRequestDTO.status
      }
    };
  }
}