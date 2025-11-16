import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final senha = TextEditingController();
  String erro = '';

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Entrar')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // imagem ilustrativa opcional
                SizedBox(height: 120, child: Image.asset('assets/images/logo.png', fit: BoxFit.contain)),
                const SizedBox(height: 16),
                TextField(controller: email, decoration: const InputDecoration(labelText: 'Email')),
                const SizedBox(height: 8),
                TextField(controller: senha, decoration: const InputDecoration(labelText: 'Senha'), obscureText: true),
                const SizedBox(height: 12),
                if (erro.isNotEmpty) Text(erro, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await auth.login(email.text.trim(), senha.text.trim());
                      Navigator.pushReplacementNamed(context, '/home');
                    } catch (e) {
                      setState(() => erro = 'Erro ao fazer login: \$e');
                    }
                  },
                  child: const Text('Entrar'),
                ),
                TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: const Text('Criar conta'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

