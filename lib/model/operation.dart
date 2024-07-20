import 'package:todo_turno/model/payment_info.dart';

enum OperationStatus {
  started,
  canceled,
  error,
  paymentAccepted,
  paymentRejected,
  dispensingTicket,
  ticketDispensed,
  dispensedCompleted,
  completed,
}

class Operation {
  String? id; //ok
  String? paymentGatewayId; //ok
  String? serverId; //ok
  double amount; //ok
  String details; //ok
  String movType; //ok
  String operationType; //ok
  bool recharge; //ok
  String supportType; //ok
  String tax; //ok
  String serialNumber; //ok
  PaymentInfo? paymentInfo; //ok
  double? operationNumber;
  bool isCommissionPercentage = true; //ok
  double? commissionFixedValue = 0.0; //ok
  double commissionPercentageValue = 0; //ok
  double totalCommission = 0; //ok
  double ivaPercentage = 0.21; //ok
  double ivaCalculated = 0; //ok
  double taxBase = 0; //ok
  double totalAmount = 0; //ok
  // String createdAt = DateUtil.currentDateString();
  OperationStatus? status = OperationStatus.started;

  Operation({
    required this.id,
    required this.paymentGatewayId,
    required this.serverId,
    required this.amount,
    required this.details,
    required this.movType,
    required this.operationType,
    required this.recharge,
    this.status,
    required this.supportType,
    required this.tax,
    required this.serialNumber,
    required this.paymentInfo,
    required this.operationNumber,
    required this.isCommissionPercentage,
    required this.commissionFixedValue,
    required this.commissionPercentageValue,
    required this.totalCommission,
    required this.ivaPercentage,
    required this.ivaCalculated,
    required this.taxBase,
    required this.totalAmount,
  }) {
  }

  Operation.fromJson(
      Map<String, dynamic> json,
      )   : id = json['id'],
        paymentGatewayId = json['paymentGatewayId'],
        serverId = json['serverId'],
        amount = json['amount'].toDouble(),
        isCommissionPercentage = json['isCommissionPercentage'],
        commissionFixedValue = (json['commissionFixedValue'] ?? 0.0).toDouble(),
        commissionPercentageValue = json['commissionPercentageValue'].toDouble(),
        totalCommission = json['totalCommission'].toDouble(),
        ivaPercentage = json['ivaPercentage'].toDouble(),
        ivaCalculated = json['ivaCalculated'].toDouble(),
        taxBase = json['taxBase'].toDouble(),
        totalAmount = json['totalAmount'].toDouble(),
        // createdAt =  DateUtil.stringDateString(json['createdAt']),
        details = json['details'],
        movType = json['movType'],
        operationType = json['operationType'],
        recharge = json['recharge'],
        status = parseOperationStatus(json['operationStatus']) ,
        supportType = json['supportType'],
        tax = json['tax'],
        serialNumber = json['serialNumber'],
        operationNumber = (json['operationNumber'] ?? 0.0).toDouble(),
        paymentInfo = json["paymentDetails"]!=null? PaymentInfo.fromJson(json["paymentDetails"]):null;

  static Operation toJson(Operation operation) {
    return Operation(
        id: operation.id,
        paymentGatewayId: operation.paymentGatewayId,
        serverId: operation.serverId,
        amount: operation.amount,
        details: operation.details,
        movType: operation.movType,
        operationType: operation.operationType,
        recharge: operation.recharge,
        // status: parseOperationStatus(operation.operationStatus),
        supportType: operation.supportType,
        tax: operation.tax,
        serialNumber: operation.serialNumber,
        paymentInfo: operation.paymentInfo,
        operationNumber: double.parse("000"),
        isCommissionPercentage: operation.isCommissionPercentage,
        commissionFixedValue: double.parse("0.0"),
        commissionPercentageValue:
        double.parse(operation.commissionPercentageValue.toString()),
        totalCommission: double.parse(operation.totalCommission.toString()),
        ivaPercentage: double.parse(operation.ivaPercentage.toString()),
        ivaCalculated: double.parse(operation.ivaCalculated.toString()),
        taxBase: double.parse(operation.taxBase.toString()),
        totalAmount: double.parse(operation.totalAmount.toString()));
  }
  static OperationStatus parseOperationStatus(String status){
    OperationStatus operationStatus = OperationStatus.error;

      operationStatus = OperationStatus.values.firstWhere((element) => element.name.toString().toLowerCase().trim() == status.toLowerCase().trim(),orElse:()=>OperationStatus.error);

    return operationStatus;
  }

}

