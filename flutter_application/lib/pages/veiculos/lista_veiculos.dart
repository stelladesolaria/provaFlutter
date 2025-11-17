import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';

class ListaVeiculosPage extends StatelessWidget {
  final service = FirestoreService();
  ListaVeiculosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Veículos')),
      body: StreamBuilder(
        stream: service.streamVeiculos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return const Center(child: Text('Nenhum veículo cadastrado'));
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, i) {
              final v = docs[i];
              return ListTile(
                title: Text(v['modelo'] ?? ''),
                subtitle: Text('${v['marca'] ?? ''} - ${v['placa'] ?? ''}'),
                trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => service.deleteVeiculo(v.id)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => Navigator.pushNamed(context, '/novo-veiculo'), child: const Icon(Icons.add)),
    );
  }
}
