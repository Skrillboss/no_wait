class PaymentInfo {
  final String cardNumber;
  final String cardHolderName;
  final DateTime expiryDate;
  String cardType;
  final String cvv;

  PaymentInfo({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cardType,
    required this.cvv,
  });
}
