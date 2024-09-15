class RegisterBusinessDTO {
  final String cif;
  final String name;
  final String? imageBase64; // Optional
  final String phone;
  final String address;
  final String email;

  RegisterBusinessDTO({
    required this.cif,
    required this.name,
    this.imageBase64,
    required this.phone,
    required this.address,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'cif': cif,
      'name': name,
      'imageBase64': imageBase64,
      'phone': phone,
      'address': address,
      'email': email,
    };
  }
}
