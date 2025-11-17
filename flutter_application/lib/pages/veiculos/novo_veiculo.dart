import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';

class NovoVeiculoPage extends StatefulWidget {
  const NovoVeiculoPage({super.key});
  @override
  State<NovoVeiculoPage> createState() => _NovoVeiculoPageState();
}

class _NovoVeiculoPageState extends State<NovoVeiculoPage> {
  final modelo = TextEditingController();
  final marca = TextEditingController();
  final placa = TextEditingController();
  final ano = TextEditingController();
  String tipo = 'Gasolina';
  final service = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Veículo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: modelo, decoration: const InputDecoration(labelText: 'Modelo')),
          const SizedBox(height: 8),
          TextField(controller: marca, decoration: const InputDecoration(labelText: 'Marca')),
          const SizedBox(height: 8),
          TextField(controller: placa, decoration: const InputDecoration(labelText: 'Placa')),
          const SizedBox(height: 8),
          TextField(controller: ano, decoration: const InputDecoration(labelText: 'Ano'), keyboardType: TextInputType.number),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(initialValue: tipo, items: ['Gasolina','Etanol','Flex','Diesel'].map((e)=>DropdownMenuItem(value:e,child:Text(e))).toList(), onChanged: (v)=>setState(()=>tipo=v!)),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: () async {
            final a = int.tryParse(ano.text) ?? 0;
            await service.addVeiculo({
              'modelo': modelo.text,
              'marca': marca.text,
              'placa': placa.text,
              'ano': a,
              'tipoCombustivel': tipo,
            });
            Navigator.pop(context);
          }, child: const Text('Salvar'))
        ]),
      ),
    );
  }
}