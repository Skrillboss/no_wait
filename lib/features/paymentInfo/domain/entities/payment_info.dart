class PaymentInfo {
  final String id;
  final String cardNumber;
  final String cardHolderName;
  final DateTime expiryDate;
  final String cardType;
  final String cvv;

  PaymentInfo({
    required this.id,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cardType,
    required this.cvv,
  });
}
