class ReadShiftsDemoClient {
  Future<Map<String, dynamic>> getShifts(String userId, String token) async {
    final Map<String, dynamic> response = {
      "shifts": [
        {
          "shiftId": "1",
          "shiftTime": "2024-07-30T10:00:00Z",
          "createAt": "2024-07-29T09:00:00Z",
          "notifyTime": "2024-07-29T10:00:00Z",
          "expirationTime": "2024-07-31T10:00:00Z",
          "estimatedArrivalTime": "00:15:00",
          "status": "active",
          "shiftNumber": 1
        },
        {
          "shiftId": "2",
          "shiftTime": "2024-07-30T10:00:00Z",
          "createAt": "2024-07-29T09:00:00Z",
          "notifyTime": "2024-07-29T10:00:00Z",
          "expirationTime": "2024-07-31T10:00:00Z",
          "estimatedArrivalTime": "00:15:00",
          "status": "active",
          "shiftNumber": 2
        },        {
          "shiftId": "3",
          "shiftTime": "2024-07-30T10:00:00Z",
          "createAt": "2024-07-29T09:00:00Z",
          "notifyTime": "2024-07-29T10:00:00Z",
          "expirationTime": "2024-07-31T10:00:00Z",
          "estimatedArrivalTime": "00:15:00",
          "status": "active",
          "shiftNumber": 3
        },
      ]
    };

    await Future.delayed(const Duration(seconds: 1));
    return response;
  }
}
