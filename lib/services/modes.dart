
enum ModoAcao {
  nenhuma,
  presenca,
  saida,
}

extension ModoLabel on ModoAcao {
  String get label {
    switch (this) {
      case ModoAcao.presenca:
        return "ENTRADA";

      case ModoAcao.saida:
        return "SAÍDA";

      case ModoAcao.nenhuma:
      default:
        return "";
    }
  }
}