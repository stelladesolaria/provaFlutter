import 'package:flutter/material.dart';
import '../pages/auth/login_page.dart';
import '../pages/auth/register_page.dart';
import '../pages/home/home_page.dart';
import '../pages/veiculos/lista_veiculos.dart';
import '../pages/veiculos/novo_veiculo.dart';
import '../pages/abastecimentos/lista_abastecimentos.dart';
import '../pages/abastecimentos/novo_abastecimento.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/': (c) => const LoginPage(),
    '/register': (c) => const RegisterPage(),
    '/home': (c) => const HomePage(),
    '/meus-veiculos': (c) => ListaVeiculosPage(),
    '/novo-veiculo': (c) => NovoVeiculoPage(),
    '/meus-abastecimentos': (c) => ListaAbastecimentosPage(),
    '/novo-abastecimento': (c) => NovoAbastecimentoPage(),
  };
}
