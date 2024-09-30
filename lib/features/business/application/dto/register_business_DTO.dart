class RegisterBusinessDTO {
  final String cif;
  final String name;
  final String? imageUrl; // Optional
  final String phone;
  final String address;
  final String email;

  RegisterBusinessDTO({
    required this.cif,
    required this.name,
    this.imageUrl,
    required this.phone,
    required this.address,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'cif': cif,
      'name': name,
      'imageUrl': imageUrl,
      'phone': phone,
      'address': address,
      'email': email,
    };
  }
}
