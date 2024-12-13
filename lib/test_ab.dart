import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ABTestPage extends StatelessWidget {
  const ABTestPage({super.key});

  Color getButtonColor(String buttonColorName) {
    switch (buttonColorName) {
      case 'VERMELHO':
        return Colors.red;
      case 'AZUL':
        return Colors.blue;
      case 'AMARELO':
        return Colors.yellow;
      case 'VERDE':
        return Colors.green;
      default:
        return Colors.white;
    }
  }

  Widget getSignUpButton(BuildContext context) {
    final String buttonType =
        FirebaseRemoteConfig.instance.getString('TIPO_DO_BOTAO');
    final String buttonColorName =
        FirebaseRemoteConfig.instance.getString('COR_DO_BOTAO');
    final Color buttonColor = getButtonColor(buttonColorName);

    print('Button type: $buttonType - $buttonColorName');

    FirebaseRemoteConfig.instance.fetchAndActivate();
    FirebaseAnalytics.instance.setUserId(id: const Uuid().v4());

    if (buttonType == 'OUTLINED') {
      return OutlinedButton(
        onPressed: () {
          showSignUpDialog(context);
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 3.0,
            color: buttonColor,
          ),
        ),
        child: const Text(
          'Cadastrar-se',
          style: TextStyle(color: Colors.black),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          showSignUpDialog(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        child: const Text(
          'Cadastrar-se',
          style: TextStyle(color: Colors.black),
        ),
      );
    }
  }

  void showUnderConstructionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Em Construção'),
          content: const Text('Este produto ainda está em construção.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showSignUpDialog(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cadastrar-se'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                  'Por favor, insira seu email para entrar na lista de espera.'),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                FirebaseAnalytics.instance.logEvent(name: 'sign_up_cancelled');
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                FirebaseAnalytics.instance.logEvent(name: 'sign_up_done');
              },
              child: const Text('Enviar'),
            ),
          ],
        );
      },
    );
  }

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
              backgroundImage:
                  NetworkImage('https://avatar.iran.liara.run/public'),
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
              child: getSignUpButton(context),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  showUnderConstructionDialog(context);
                },
                child: const Text('Conhecer mais sobre o produto'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  showUnderConstructionDialog(context);
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
