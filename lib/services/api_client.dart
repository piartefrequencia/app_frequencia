

import 'dart:convert';
import 'package:http/http.dart' as http;

const String API_BASE = "http://10.0.2.2:8080/api/artefrequencia";

class ApiClient {
  static Future<bool> registrar({
    required int alunoId,
    required String tipo,
  }) async {
    final response = await http.post(
      Uri.parse("$API_BASE/frequencia/registrar"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "alunoId": alunoId,
        "tipo": tipo,
      }),
    );

    return response.statusCode == 200;
  }
}
