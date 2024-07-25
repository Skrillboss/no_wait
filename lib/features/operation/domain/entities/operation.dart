// lib/features/operation/domain/entities/operation.dart

import 'package:todo_turno/features/paymentInfo/domain/entities/payment_info.dart';
import 'operation_status.dart'; // Importa el enum OperationStatus

class Operation {
  final String? id; // Identificador de la operación
  final String? paymentGatewayId; // ID del gateway de pago
  final String? serverId; // ID del servidor
  final double amount; // Monto de la operación
  final String details; // Detalles de la operación
  final String tax; // Impuesto
  final String serialNumber; // Número de serie
  final PaymentInfo? paymentInfo; // Información de pago
  final double? operationNumber; // Número de operación
  final bool isCommissionPercentage; // Si la comisión es un porcentaje
  final double commissionFixedValue; // Valor fijo de la comisión
  final double commissionPercentageValue; // Valor de la comisión en porcentaje
  final double totalCommission; // Comisión total
  final double ivaPercentage; // Porcentaje de IVA
  final double ivaCalculated; // IVA calculado
  final double taxBase; // Base imponible
  final double totalAmount; // Monto total
  final OperationStatus? status; // Estado de la operación

  Operation({
    this.id,
    this.paymentGatewayId,
    this.serverId,
    required this.amount,
    required this.details,
    required this.tax,
    required this.serialNumber,
    this.paymentInfo,
    this.operationNumber,
    required this.isCommissionPercentage,
    required this.commissionFixedValue,
    required this.commissionPercentageValue,
    required this.totalCommission,
    required this.ivaPercentage,
    required this.ivaCalculated,
    required this.taxBase,
    required this.totalAmount,
    this.status,
  });
}
