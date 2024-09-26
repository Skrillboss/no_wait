class RegisterRoleDTO {
  final String name;

  RegisterRoleDTO({required this.name});

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
