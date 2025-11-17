import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';

class ListaAbastecimentosPage extends StatelessWidget {
  final service = FirestoreService();
  ListaAbastecimentosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Histórico de Abastecimentos')),
      body: StreamBuilder(
        stream: service.streamAbastecimentos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return const Center(child: Text('Nenhum abastecimento'));
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, i) {
              final a = docs[i];
              return ListTile(
                title: Text(a['veiculoId'] ?? ''),
                subtitle: Text('Litros: \${a['quantidadeLitros'] ?? ''} - R\$ \${a['valorPago'] ?? ''}'),
                trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => service.deleteAbastecimento(a.id)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => Navigator.pushNamed(context, '/novo-abastecimento'), child: const Icon(Icons.add)),
    );
  }
}

