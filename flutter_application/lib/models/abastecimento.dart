class Abastecimento {
  String id;
  DateTime data;
  double quantidadeLitros;
  double valorPago;
  double quilometragem;
  String tipoCombustivel;
  String veiculoId;
  double consumo; // optional
  String observacao;

  Abastecimento({required this.id, required this.data, required this.quantidadeLitros, required this.valorPago, required this.quilometragem, required this.tipoCombustivel, required this.veiculoId, required this.consumo, required this.observacao});

  Map<String, dynamic> toMap() => {
    'data': data.toIso8601String(),
    'quantidadeLitros': quantidadeLitros,
    'valorPago': valorPago,
    'quilometragem': quilometragem,
    'tipoCombustivel': tipoCombustivel,
    'veiculoId': veiculoId,
    'consumo': consumo,
    'observacao': observacao,
  };

  static Abastecimento fromDoc(dynamic doc) {
    final data = doc.data();
    return Abastecimento(
      id: doc.id,
      data: DateTime.parse(data['data']),
      quantidadeLitros: (data['quantidadeLitros'] ?? 0).toDouble(),
      valorPago: (data['valorPago'] ?? 0).toDouble(),
      quilometragem: (data['quilometragem'] ?? 0).toDouble(),
      tipoCombustivel: data['tipoCombustivel'] ?? '',
      veiculoId: data['veiculoId'] ?? '',
      consumo: (data['consumo'] ?? 0).toDouble(),
      observacao: data['observacao'] ?? '',
    );
  }
}
