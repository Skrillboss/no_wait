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

  // Crear una instancia de PaymentInfo a partir de un JSON
  factory PaymentInfo.fromJson(Map<String, dynamic> json) {
    return PaymentInfo(
      cardNumber: json['cardNumber'] as String,
      cardHolderName: json['cardHolderName'] as String,
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      cardType: json['cardType'] as String,
      cvv: json['cvv'] as String,
    );
  }

  // Convertir una instancia de PaymentInfo a un JSON
  Map<String, dynamic> toJson() {
    return {
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'expiryDate': expiryDate.toIso8601String(),
      'cardType': cardType,
      'cvv': cvv,
    };
  }
}
