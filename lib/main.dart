import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const ABTestPage(),
    );
  }
}

class ABTestPage extends StatelessWidget {
  const ABTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste A/B'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Bem-vindo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Bem-vindo à nossa rede social. Conecte-se com amigos e familiares, compartilhe momentos e descubra novas histórias.',
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Ação do botão "Cadastrar-se"
                },
                child: const Text('Cadastrar-se'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // Ação do botão "Conhecer mais sobre o produto"
                },
                child: const Text('Conhecer mais sobre o produto'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // Ação do botão "Entrar na rede social"
                },
                child: const Text('Entrar na rede social'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
