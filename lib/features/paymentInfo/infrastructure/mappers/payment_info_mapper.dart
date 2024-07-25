import '../../domain/entities/payment_info.dart';

class PaymentInfoMapper {
  static PaymentInfo fromJson(Map<String, dynamic> json) {
    return PaymentInfo(
      cardNumber: json['cardNumber'],
      cardHolderName: json['cardHolderName'],
      expiryDate: DateTime.parse(json['expiryDate']), // Asume que la fecha está en formato ISO 8601
      cardType: json['cardType'],
      cvv: json['cvv'],
    );
  }

  static Map<String, dynamic> toJson(PaymentInfo paymentInfo) {
    return {
      'cardNumber': paymentInfo.cardNumber,
      'cardHolderName': paymentInfo.cardHolderName,
      'expiryDate': paymentInfo.expiryDate.toIso8601String(), // Convierte la fecha a formato ISO 8601
      'cardType': paymentInfo.cardType,
      'cvv': paymentInfo.cvv,
    };
  }
}
