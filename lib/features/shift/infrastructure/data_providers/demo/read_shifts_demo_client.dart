class ReadShiftsDemoClient {
  Future<Map<String, dynamic>> getShifts(String userId, String token) async {
    final Map<String, dynamic> response = {
      "shifts": [
        {
          "shiftId": "1",
          "shiftTime": "2024-07-30T10:00:00Z",
          "business": {
            "id": "b1",
            "name": "Business One"
          },
          "item": {
            "id": "i1",
            "name": "Item One",
            "description": "Description of Item One",
            "imageUrl": "http://example.com/image1.jpg",
            "duration": "00:10:00",
            "status": "active"
          },
          "createAt": "2024-07-29T09:00:00Z",
          "notifyTime": "2024-07-29T10:00:00Z",
          "expirationTime": "2024-07-31T10:00:00Z",
          "estimatedArrivalTime": "00:15:00",
          "user": {
            "userId": "u1",
            "name": "User One",
            "nickName": "User1",
            "email": "user1@example.com",
            "phoneNumber": "1234567890",
            "paymentInfo": null,
            "business": null
          },
          "status": "active",
          "shiftNumber": 1
        },
        {
          "shiftId": "2",
          "shiftTime": "2024-07-30T11:00:00Z",
          "business": {
            "id": "b2",
            "name": "Business Two"
          },
          "item": {
            "id": "i2",
            "name": "Item Two",
            "description": "Description of Item Two",
            "imageUrl": "http://example.com/image2.jpg",
            "duration": "00:20:00",
            "status": "inactive"
          },
          "createAt": "2024-07-29T10:00:00Z",
          "notifyTime": "2024-07-29T11:00:00Z",
          "expirationTime": "2024-07-31T11:00:00Z",
          "estimatedArrivalTime": "00:30:00",
          "user": {
            "userId": "u2",
            "name": "User Two",
            "nickName": "User2",
            "email": "user2@example.com",
            "phoneNumber": "0987654321",
            "paymentInfo": null,
            "business": null
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
