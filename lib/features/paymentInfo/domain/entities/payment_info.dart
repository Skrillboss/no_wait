class PaymentInfo {
  final String id;
  final String cardNumber;
  final String cardHolderName;
  final DateTime expiryDate;

  PaymentInfo({
    required this.id,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
  });
}
