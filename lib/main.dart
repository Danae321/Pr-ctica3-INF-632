import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Funcionalidades',
      home: const MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MENÚ PRINCIPAL'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PalindromeScreen(),
                  ),
                );
              },
              child: const Text('verificar palíndromo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FriendlyNumbersScreen(),
                  ),
                );
              },
              child: const Text('números amigos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BinaryConverterScreen(),
                  ),
                );
              },
              child: const Text('convertir a binario'),
            ),
          ],
        ),
      ),
    );
  }
}


class PalindromeScreen extends StatelessWidget {
  const PalindromeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('verificar palindromo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'ingrese una oración',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final text = textController.text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
                final isPalindrome = text == text.split('').reversed.join('');
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(isPalindrome
                        ? 'es palíndromo'
                        : 'no es palíndromo'),
                  ),
                );
              },
              child: const Text('verificar'),
            ),
          ],
        ),
      ),
    );
  }
}

class FriendlyNumbersScreen extends StatelessWidget {
  const FriendlyNumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController num1Controller = TextEditingController();
    final TextEditingController num2Controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('números amigos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'número 1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'número 2',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final num1 = int.tryParse(num1Controller.text) ?? 0;
                final num2 = int.tryParse(num2Controller.text) ?? 0;

                int sumOfDivisors(int n) =>
                    List.generate(n - 1, (i) => i + 1).where((i) => n % i == 0).fold(0, (a, b) => a + b);

                final areFriends = sumOfDivisors(num1) == num2 &&
                    sumOfDivisors(num2) == num1;

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(areFriends
                        ? 'son números amigos'
                        : 'no son números amigos'),
                  ),
                );
              },
              child: const Text('verificar'),
            ),
          ],
        ),
      ),
    );
  }
}

class BinaryConverterScreen extends StatelessWidget {
  const BinaryConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController numberController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('convertir a binario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'ingrese un numero',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final number = int.tryParse(numberController.text) ?? 0;
                final binary = number.toRadixString(2);

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text('el número en binario es: $binary'),
                  ),
                );
              },
              child: const Text('convertir'),
            ),
          ],
        ),
      ),
    );
  }
}
