import 'package:todo_turno/features/shift/domain/entities/shift.dart';
import 'package:todo_turno/features/business/domain/entities/business.dart';
import 'package:todo_turno/features/user/domain/entities/user.dart';
import 'package:todo_turno/features/paymentInfo/domain/entities/payment_info.dart';
import 'package:todo_turno/features/item/domain/entities/item.dart'; // Importar el modelo Item

// TODO: EN EL MOMENTO QUE ESTE IMPLEMENTADO UNA VERSIÓN DEMO, ESTE UTIL DEBE DESAPARECER
class Util {
  static Business getSampleBusiness() {
    return Business(
      id: 'business001',
      cif: 'B12345678',
      name: 'Sample Business',
      phone: '+1234567890',
      address: '123 Sample Street, Sample City',
      imageUrl: 'imagen.json or png or com',
      email: 'contact@samplebusiness.com',
      createdAt: DateTime.now(),
      item: getSampleItem()
    );
  }

  static PaymentInfo getSamplePaymentInfo() {
    return PaymentInfo(
      cardNumber: '1234567812345678',
      cardHolderName: 'John Doe',
      expiryDate: DateTime(2025, 12),
      cardType: 'Visa',
      cvv: '123',
    );
  }

  static User getSampleUser() {
    return User(
      userId: 'user001',
      name: 'John Doe',
      nickName: 'JohnPradels_659',
      email: 'john.doe@example.com',
      phoneNumber: '+0987654321',
      paymentInfo: getSamplePaymentInfo(),
      business: getSampleBusiness(),
      shifts: [getSampleShift(), getSampleShift(), getSampleShift()]
    );
  }

  static Item getSampleItem() {
    return Item(
      id: 'I1',
      name: 'Sample Item',
      description: 'This is a description of the sample item.',
      imageUrl: 'https://example.com/sample-item.jpg',
      duration: const Duration(minutes: 5),
      status: ItemStatus.active,
    );
  }

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
