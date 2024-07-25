import 'package:todo_turno/features/operation/domain/entities/operation.dart';
import '../../../paymentInfo/infrastructure/mappers/payment_info_mapper.dart';
import '../../domain/entities/operation_status.dart';

class OperationMapper {
  static Operation fromJson(Map<String, dynamic> json) {
    return Operation(
      id: json['id'],
      paymentGatewayId: json['paymentGatewayId'],
      serverId: json['serverId'],
      amount: json['amount'].toDouble(),
      details: json['details'],
      status: _parseOperationStatus(json['operationStatus']),
      tax: json['tax'],
      serialNumber: json['serialNumber'],
      paymentInfo: json["paymentDetails"] != null
          ? PaymentInfoMapper.fromJson(json["paymentDetails"])
          : null,
      operationNumber: (json['operationNumber'] ?? 0.0).toDouble(),
      isCommissionPercentage: json['isCommissionPercentage'],
      commissionFixedValue: (json['commissionFixedValue'] ?? 0.0).toDouble(),
      commissionPercentageValue: json['commissionPercentageValue'].toDouble(),
      totalCommission: json['totalCommission'].toDouble(),
      ivaPercentage: json['ivaPercentage'].toDouble(),
      ivaCalculated: json['ivaCalculated'].toDouble(),
      taxBase: json['taxBase'].toDouble(),
      totalAmount: json['totalAmount'].toDouble(),
    );
  }

  static Map<String, dynamic> toJson(Operation operation) {
    return {
      'id': operation.id,
      'paymentGatewayId': operation.paymentGatewayId,
      'serverId': operation.serverId,
      'amount': operation.amount,
      'details': operation.details,
      'operationStatus': operation.status?.name,
      'tax': operation.tax,
      'serialNumber': operation.serialNumber,
      'paymentDetails': operation.paymentInfo != null
          ? PaymentInfoMapper.toJson(operation.paymentInfo!)
          : null,
      'operationNumber': operation.operationNumber,
      'isCommissionPercentage': operation.isCommissionPercentage,
      'commissionFixedValue': operation.commissionFixedValue,
      'commissionPercentageValue': operation.commissionPercentageValue,
      'totalCommission': operation.totalCommission,
      'ivaPercentage': operation.ivaPercentage,
      'ivaCalculated': operation.ivaCalculated,
      'taxBase': operation.taxBase,
      'totalAmount': operation.totalAmount,
    };
  }

  static OperationStatus _parseOperationStatus(String status) {
    return OperationStatus.values.firstWhere(
          (element) => element.name.toLowerCase() == status.toLowerCase(),
      orElse: () => OperationStatus.error,
    );
  }
}
