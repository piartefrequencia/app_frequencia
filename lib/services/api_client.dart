

import 'dart:convert';
import 'package:http/http.dart' as http;

const String API_BASE;

class ApiClient {
  static Future<bool> registrar({
    required int alunoId,
    required String tipo,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$API_BASE/frequencia/registrar"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"alunoId": alunoId, "tipo": tipo}),
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print("Erro na requisição: $e");
      return false;
    }
  }
}

