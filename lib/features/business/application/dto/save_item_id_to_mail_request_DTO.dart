class SaveItemIdToMailRequestDTO{
  final String businessId;
  final String itemId;

  SaveItemIdToMailRequestDTO(this.businessId, this.itemId);

  Map<String, dynamic> toJson() {
    return {
      'businessId': businessId,
      'itemId': itemId
    };
  }
}