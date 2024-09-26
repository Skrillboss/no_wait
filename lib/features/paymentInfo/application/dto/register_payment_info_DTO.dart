class RegisterPaymentInfoDTO {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cardType;
  final String cvv;

  RegisterPaymentInfoDTO({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cardType,
    required this.cvv,
  });

  Map<String, dynamic> toJson() {
    return {
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'expiryDate': expiryDate,
      'cardType': cardType,
      'cvv': cvv,
    };
  }
}
