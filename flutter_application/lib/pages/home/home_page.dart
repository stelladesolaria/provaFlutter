import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Início')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Text('Abastecimento')),
            ListTile(title: const Text('Meus Veículos'), onTap: () => Navigator.pushNamed(context, '/meus-veiculos')),
            ListTile(title: const Text('Registrar Abastecimento'), onTap: () => Navigator.pushNamed(context, '/novo-abastecimento')),
            ListTile(title: const Text('Histórico de Abastecimentos'), onTap: () => Navigator.pushNamed(context, '/meus-abastecimentos')),
            const Divider(),
            ListTile(title: const Text('Sair'), onTap: () async { await auth.logout(); Navigator.pushReplacementNamed(context, '/'); }),
          ],
        ),
      ),
      body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: const [Text('Bem-vindo!'), SizedBox(height: 8), Text('Use o menu lateral para navegar')])),
    );
  }
}