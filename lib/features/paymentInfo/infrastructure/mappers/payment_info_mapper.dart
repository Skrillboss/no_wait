import '../../domain/entities/payment_info.dart';

class PaymentInfoMapper {
  static PaymentInfo fromJson(Map<String, dynamic> json) {
    return PaymentInfo(
      id: json['paymentInfoId'],
      cardNumber: json['cardNumber'],
      cardHolderName: json['cardHolderName'],
      expiryDate: DateTime.parse(json['expiryDate']),
      // Formato ISO 8601
      cardType: json['cardType'],
      cvv: json['cvv'],
    );
  }

  static List<PaymentInfo> listFromJson(List<dynamic> jsonList) {
    return jsonList
        .map((json) => fromJson(json as Map<String, dynamic>))
        .toList();
  }

  static Map<String, dynamic> toJson(PaymentInfo paymentInfo) {
    return {
      'paymentInfoId': paymentInfo.id,
      'cardNumber': paymentInfo.cardNumber,
      'cardHolderName': paymentInfo.cardHolderName,
      'expiryDate': paymentInfo.expiryDate.toIso8601String(),
      // Convertir fecha a ISO 8601
      'cardType': paymentInfo.cardType,
      'cvv': paymentInfo.cvv,
    };
  }

  static List<Map<String, dynamic>> listToJson(
      List<PaymentInfo?> paymentInfoList) {
    return paymentInfoList
        .where((paymentInfo) => paymentInfo != null)
        .map((paymentInfo) => toJson(paymentInfo!))
        .toList();
  }
}
