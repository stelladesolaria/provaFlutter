import 'package:flutter/material.dart';
//import 'core/theme.dart';
//import 'core/routes.dart';
import 'services/auth_service.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: Consumer<AuthService>(
        builder: (context, auth, _) {
          return MaterialApp(
            title: 'Abastecimento',
            theme: AppTheme.theme,
            initialRoute: '/',
            routes: AppRoutes.routes,
            home: auth.isLoading
                ? const Scaffold(body: Center(child: CircularProgressIndicator()))
                : (auth.user == null ? const LoginPageRedirect() : const HomeRedirect()),
          );
        },
      ),
    );
  }
}
