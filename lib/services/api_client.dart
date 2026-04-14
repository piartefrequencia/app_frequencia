

import 'dart:convert';
import 'package:http/http.dart' as http;


const bool isDevelopment = true; 

const String API_BASE = isDevelopment 
    ? "http://192.168.1.110:8080/api/artefrequencia" 
    : "https://apiartefrequencia.onrender.com/api/artefrequencia";

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

