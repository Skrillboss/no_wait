class PaymentDetails {
  String applicationId;
  String authCode;
  String cardNumber;
  String cardId;
  String cardType;
  int operationNum;
  String verificationType;
  String payload;
  String bankOperationNumber;
  String bankAuthCode;
  String bankOperationType;
  String bankBusinessAccountNumber;
  String paymentGatewayId;
  String paymentGatewayTerminal;
  String paymentGatewayOperationUID;
  String paymentGatewayOperationCounter;
  String paymentGatewayTerminalVerificationResult;
  String paymentGatewayCommission;
  String receiptSignRequiredLabel;
  bool receiptSignRequired;
  bool receiptContactless;
  String cardApplicationLabel;
  String cardVerificationType;
  String paymentGatewayResponseCode;
  String paymentGatewayResponseHcp;
  String paymentGatewayApplicationId;
  bool receiptOnlyForClient;
  String response;

  // String createdAt;

  PaymentDetails({
    required this.bankOperationNumber,
    required this.bankAuthCode,
    required this.bankOperationType,
    required this.bankBusinessAccountNumber,
    required this.paymentGatewayId,
    required this.paymentGatewayTerminal,
    required this.paymentGatewayOperationUID,
    required this.paymentGatewayOperationCounter,
    required this.paymentGatewayTerminalVerificationResult,
    required this.paymentGatewayCommission,
    required this.receiptSignRequiredLabel,
    required this.receiptSignRequired,
    required this.receiptContactless,
    required this.cardApplicationLabel,
    required this.cardVerificationType,
    required this.paymentGatewayResponseCode,
    required this.paymentGatewayResponseHcp,
    required this.paymentGatewayApplicationId,
    required this.receiptOnlyForClient,
    required this.response,
    required this.applicationId,
    required this.authCode,
    required this.cardNumber,
    required this.cardId,
    required this.cardType,
    required this.operationNum,
    required this.verificationType,
    required this.payload,
    // required this.createdAt
  });

  PaymentDetails.fromJson(Map<String, dynamic> json)
      : applicationId = json['applicationId'],
        authCode = json['authCode'],
        cardNumber = json['cardNumber'],
        cardId = json['cardId'],
        cardType = json['cardType'],
        operationNum = json['operationNum'],
        verificationType = json['verificationType'],
        payload = json['payload'],
        bankOperationNumber = json['bankOperationNumber'],
        bankAuthCode = json['bankAuthCode'],
        bankOperationType = json['bankOperationType'],
        bankBusinessAccountNumber = json['bankBusinessAccountNumber'],
        paymentGatewayId = json['paymentGatewayId'],
        paymentGatewayTerminal = json['paymentGatewayTerminal'],
        paymentGatewayOperationUID = json['paymentGatewayOperationUID'],
        paymentGatewayOperationCounter = json['paymentGatewayOperationCounter'],
        paymentGatewayTerminalVerificationResult =
            json['paymentGatewayTerminalVerificationResult'],
        paymentGatewayCommission = json['paymentGatewayCommission'],
        receiptSignRequiredLabel = json['receiptSignRequiredLabel'],
        receiptSignRequired = json['receiptSignRequired'],
        receiptContactless = json['receiptContactless'],
        cardApplicationLabel = json['cardApplicationLabel'],
        cardVerificationType = json['cardVerificationType'],
        paymentGatewayResponseCode = json['paymentGatewayResponseCode'],
        paymentGatewayResponseHcp = json['paymentGatewayResponseHcp'],
        paymentGatewayApplicationId = json['paymentGatewayApplicationId'],
        receiptOnlyForClient = json['receiptOnlyForClient'],
        response = json['response'];
// createdAt = DateUtil.stringDateString(json['created'].toString());

  @override
  String toString() {
    return 'PaymentDetails{applicationId: $applicationId, authCode: $authCode, cardNumber: $cardNumber, cardId: $cardId, cardType: $cardType, operationNum: $operationNum, verificationType: $verificationType, payload: $payload, bankOperationNumber: $bankOperationNumber, bankAuthCode: $bankAuthCode, bankOperationType: $bankOperationType, bankBusinessAccountNumber: $bankBusinessAccountNumber, paymentGatewayId: $paymentGatewayId, paymentGatewayTerminal: $paymentGatewayTerminal, paymentGatewayOperationUID: $paymentGatewayOperationUID, paymentGatewayOperationCounter: $paymentGatewayOperationCounter, paymentGatewayTerminalVerificationResult: $paymentGatewayTerminalVerificationResult, paymentGatewayCommission: $paymentGatewayCommission, receiptSignRequiredLabel: $receiptSignRequiredLabel, receiptSignRequired: $receiptSignRequired, receiptContactless: $receiptContactless, cardApplicationLabel: $cardApplicationLabel, cardVerificationType: $cardVerificationType, paymentGatewayResponseCode: $paymentGatewayResponseCode, paymentGatewayResponseHcp: $paymentGatewayResponseHcp, paymentGatewayApplicationId: $paymentGatewayApplicationId, receiptOnlyForClient: $receiptOnlyForClient, response: $response}';
  }
}
