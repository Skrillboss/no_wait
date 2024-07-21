import 'package:todo_turno/model/shift.dart';
import 'package:todo_turno/model/business.dart';
import 'package:todo_turno/model/user.dart';
import 'package:todo_turno/model/payment_info.dart';
import 'package:todo_turno/model/item.dart'; // Importar el modelo Item

// TODO: EN EL MOMENTO QUE ESTE IMPLEMENTADO UNA VERSIÓN DEMO, ESTE UTIL DEBE DESAPARECER
class Util {
  // Método estático para obtener un modelo de prueba de Business
  static Business getSampleBusiness() {
    return Business(
      id: 'business001',
      cif: 'B12345678',
      name: 'Sample Business',
      phone: '+1234567890',
      address: '123 Sample Street, Sample City',
      imageUrl: 'imagen.json or png or com',
      email: 'contact@samplebusiness.com',
      createdAt: '2024-01-01T00:00:00Z',
    );
  }

  // Método estático para obtener un modelo de prueba de PaymentInfo
  static PaymentInfo getSamplePaymentInfo() {
    return PaymentInfo(
      cardNumber: '1234567812345678',
      cardHolderName: 'John Doe',
      expiryDate: DateTime(2025, 12),
      cardType: 'Visa',
      cvv: '123',
    );
  }

  // Método estático para obtener un modelo de prueba de User
  static User getSampleUser() {
    return User(
      userId: 'user001',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phoneNumber: '+0987654321',
      paymentInfo: getSamplePaymentInfo(),
    );
  }

  // Método estático para obtener un modelo de prueba de Item
  static Item getSampleItem() {
    return Item(
      id: 'I1',
      name: 'Sample Item',
      description: 'This is a description of the sample item.',
      imageUrl: 'https://example.com/sample-item.jpg',
      status: ItemStatus.active,
    );
  }

  // Método estático para obtener un modelo de prueba de Shift
  static Shift getSampleShift() {
    return Shift(
      shiftId: 'shift001',
      shiftTime: DateTime.now().add(const Duration(hours: 2)),
      business: getSampleBusiness(),
      createAt: DateTime.now(),
      notifyTime: DateTime.now().add(const Duration(minutes: 85)),
      expirationTime: DateTime.now().add(const Duration(hours: 4)),
      estimatedArrivalTime: const Duration(minutes: 30),
      user: getSampleUser(),
      status: ShiftStatus.active,
      shiftNumber: 1,
      item: getSampleItem(), // Agregar la instancia de prueba del Item
    );
  }
}
