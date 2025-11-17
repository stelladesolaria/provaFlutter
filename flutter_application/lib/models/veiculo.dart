class Veiculo {
  String id;
  String modelo;
  String marca;
  String placa;
  int ano;
  String tipoCombustivel;

  Veiculo({required this.id, required this.modelo, required this.marca, required this.placa, required this.ano, required this.tipoCombustivel});

  Map<String, dynamic> toMap() => {
    'modelo': modelo,
    'marca': marca,
    'placa': placa,
    'ano': ano,
    'tipoCombustivel': tipoCombustivel,
  };

  static Veiculo fromDoc(dynamic doc) {
    final data = doc.data();
    return Veiculo(
      id: doc.id,
      modelo: data['modelo'] ?? '',
      marca: data['marca'] ?? '',
      placa: data['placa'] ?? '',
      ano: (data['ano'] ?? 0) as int,
      tipoCombustivel: data['tipoCombustivel'] ?? '',
    );
  }
}