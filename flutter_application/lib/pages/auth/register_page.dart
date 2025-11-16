import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final email = TextEditingController();
  final senha = TextEditingController();
  final senha2 = TextEditingController();
  String erro = '';

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Conta')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          TextField(controller: email, decoration: const InputDecoration(labelText: 'Email')),
          const SizedBox(height: 8),
          TextField(controller: senha, decoration: const InputDecoration(labelText: 'Senha'), obscureText: true),
          const SizedBox(height: 8),
          TextField(controller: senha2, decoration: const InputDecoration(labelText: 'Confirmar senha'), obscureText: true),
          const SizedBox(height: 12),
          if (erro.isNotEmpty) Text(erro, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: () async {
            if (senha.text != senha2.text) { setState(() => erro = 'Senhas não coincidem'); return; }
            try {
              await auth.register(email.text.trim(), senha.text.trim());
              Navigator.pushReplacementNamed(context, '/home');
            } catch (e) { setState(() => erro = 'Erro ao criar conta: \$e'); }
          }, child: const Text('Registrar'))
        ]),
      ),
    );
  }
}
