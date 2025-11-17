import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';

class NovoAbastecimentoPage extends StatefulWidget {
  const NovoAbastecimentoPage({super.key});

  @override
  State<NovoAbastecimentoPage> createState() => _NovoAbastecimentoPageState();
}

class _NovoAbastecimentoPageState extends State<NovoAbastecimentoPage> {
  final service = FirestoreService();

  final litros = TextEditingController();
  final valor = TextEditingController();
  final quilometragem = TextEditingController();
  final veiculoId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Abastecimento')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: veiculoId, decoration: const InputDecoration(labelText: 'ID do Veículo')),
            TextField(controller: litros, decoration: const InputDecoration(labelText: 'Litros'), keyboardType: TextInputType.number),
            TextField(controller: valor, decoration: const InputDecoration(labelText: 'Valor Pago'), keyboardType: TextInputType.number),
            TextField(controller: quilometragem, decoration: const InputDecoration(labelText: 'Quilometragem'), keyboardType: TextInputType.number),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await service.addAbastecimento({
                  'veiculoId': veiculoId.text,
                  'quantidadeLitros': double.tryParse(litros.text) ?? 0,
                  'valorPago': double.tryParse(valor.text) ?? 0,
                  'quilometragem': double.tryParse(quilometragem.text) ?? 0,
                  'data': DateTime.now(),
                });
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
