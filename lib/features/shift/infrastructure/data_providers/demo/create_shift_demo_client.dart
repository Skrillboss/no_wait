class CreateShiftDemoClient {
  Future<Map<String, dynamic>> createShift(
      String userId, String itemId, int peopleInShift) async {
    final Map<String, dynamic> response = {
      'shift': {
        "shiftId": "1",
        'itemName': 'Tifón',
        'businessName': 'Parque Warner',
        "shiftTime": "2024-07-30T10:00:00Z",
        'peopleInShift': peopleInShift,
        "createAt": "2024-07-29T09:00:00Z",
        "notifyTime": "2024-07-29T10:00:00Z",
        'currentWaitingDuration': 2000,
        "expirationTime": "2024-07-31T10:00:00Z",
        "estimatedArrivalTime": 15,
        "status": "active",
        "shiftNumber": 1
      },
    };
    await Future.delayed(const Duration(seconds: 1));
    return response;
  }
}
