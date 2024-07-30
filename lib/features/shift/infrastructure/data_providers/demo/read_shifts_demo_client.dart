class ReadShiftsDemoClient{
  Future<Map<String, dynamic>> getShifts(String userId, String token) async {
    final Map<String, dynamic> response = {
      "shifts": [
        {
          "shiftId": "1",
          "shiftTime": "2024-07-30T10:00:00Z",
          "business": {
            "businessId": "b1",
            "businessName": "Business One"
          },
          "item": {
            "itemId": "i1",
            "itemName": "Item One"
          },
          "createAt": "2024-07-29T09:00:00Z",
          "notifyTime": "2024-07-29T10:00:00Z",
          "expirationTime": "2024-07-31T10:00:00Z",
          "estimatedArrivalTime": "00:15:00",
          "user": {
            "userId": "u1",
            "userName": "User One"
          },
          "status": "active",
          "shiftNumber": 1
        },
        {
          "shiftId": "2",
          "shiftTime": "2024-07-30T11:00:00Z",
          "business": {
            "businessId": "b2",
            "businessName": "Business Two"
          },
          "item": {
            "itemId": "i2",
            "itemName": "Item Two"
          },
          "createAt": "2024-07-29T10:00:00Z",
          "notifyTime": "2024-07-29T11:00:00Z",
          "expirationTime": "2024-07-31T11:00:00Z",
          "estimatedArrivalTime": "00:30:00",
          "user": {
            "userId": "u2",
            "userName": "User Two"
          },
          "status": "inactive",
          "shiftNumber": 2
        }
      ]
    };

    await Future.delayed(const Duration(seconds: 1));
    return response;
  }
}