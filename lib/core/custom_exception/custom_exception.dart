class CustomException implements Exception {
  final int statusCode;
  final List<int> errorCodes;
  final List<String> codeExplications;
  final String methodName;
  final List<String> details;

  CustomException({
    required this.statusCode,
    required this.errorCodes,
    required this.codeExplications,
    required this.methodName,
    required this.details,
  });

  @override
  String toString() {
    return '''
CustomException:
  Status Code: $statusCode
  Error Codes: ${errorCodes.join(", ")}
  Code Explications: ${codeExplications.join(", ")}
  Method Name: $methodName
  Details: ${details.join("\n")}
    ''';
  }

  String showErrorToUser() {
    String formatedError = 'Error Dev: $errorCodes \nError Http: $statusCode';

    // Filtrar los códigos visibles al usuario (entre 2000 y 3999)
    List<int> visibleErrors = errorCodes.where((code) => code >= 2000 && code < 4000).toList();

    // Si hay errores visibles, formatear las explicaciones asociadas
    if (visibleErrors.isNotEmpty) {
      formatedError = visibleErrors
          .map((error) {
        int index = errorCodes.indexOf(error);
        return index != -1 && index < codeExplications.length
            ? codeExplications[index].split(": ").last
            : "Error $error";
      })
          .join("\n");
    }

    return formatedError;
  }

  // Crear un CustomException desde un Map (JSON del body)
  static CustomException fromJson(Map<String, dynamic> json) {
    return CustomException(
      statusCode: json['statusCode'] as int,
      errorCodes: List<int>.from(json['errorCode'] ?? []),
      codeExplications: List<String>.from(json['codeExplication'] ?? []),
      methodName: json['methodName'] as String? ?? 'Unknown Method',
      details: List<String>.from(json['details'] ?? []),
    );
  }
}
