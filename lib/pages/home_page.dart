
/* VERSÃO 1
import 'package:flutter/material.dart';

import '../services/modes.dart';
import '../widgets/rounded_button.dart';
import 'scanner_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ModoAcao _modo = ModoAcao.nenhuma;

  void _setModo(ModoAcao modo) {
    setState(() => _modo = modo);
  }

  void _reset() {
    setState(() => _modo = ModoAcao.nenhuma);
  }

  void _abrirCamera() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ScannerPage(modo: _modo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pro-Cidadania – Frequência'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Selecione a função e toque em CÂMERA:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                RoundedButton(
                  label: 'Presença',
                  color: Colors.green,
                  active: _modo == ModoAcao.presenca,
                  onTap: () => _setModo(ModoAcao.presenca),
                ),
                RoundedButton(
                  label: 'Fim das aulas',
                  color: Colors.amber,
                  active: _modo == ModoAcao.saida,
                  onTap: () => _setModo(ModoAcao.saida),
                ),
                RoundedButton(
                  label: 'Reset',
                  color: Colors.red,
                  active: false,
                  onTap: _reset,
                ),
                RoundedButton(
                  label: 'Câmera',
                  color: Colors.grey,
                  active: false,
                  onTap: _abrirCamera,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

/*  VERSÃO 2 

import 'package:flutter/material.dart';
import '../services/modes.dart';
import '../widgets/rounded_button.dart';
import 'scanner_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ModoAcao _modo = ModoAcao.nenhuma;

  void _setModo(ModoAcao modo) {
    setState(() => _modo = modo);
  }

  void _reset() {
    setState(() => _modo = ModoAcao.nenhuma);
  }

  void _abrirCamera() {
    if (_modo == ModoAcao.nenhuma) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecione uma ação primeiro!'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ScannerPage(modo: _modo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pro-Cidadania – Controle de Frequência'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Selecione a função e toque em CÂMERA:',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                RoundedButton(
                  label: 'Presença',
                  icon: Icons.check_circle,
                  color: Colors.green,
                  active: _modo == ModoAcao.presenca,
                  onTap: () => _setModo(ModoAcao.presenca),
                ),
                RoundedButton(
                  label: 'Saída',
                  icon: Icons.logout,
                  color: Colors.orange,
                  active: _modo == ModoAcao.saida,
                  onTap: () => _setModo(ModoAcao.saida),
                ),
                RoundedButton(
                  label: 'Reset',
                  icon: Icons.refresh,
                  color: Colors.red,
                  active: false,
                  onTap: _reset,
                ),
                RoundedButton(
                  label: 'Câmera',
                  icon: Icons.camera_alt,
                  color: Colors.grey,
                  active: false,
                  onTap: _abrirCamera,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

/* VERSÃO SEM O BOTÃO SAIR

import 'package:flutter/material.dart';
import '../services/modes.dart';
import '../widgets/rounded_button.dart';
import 'scanner_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ModoAcao _modo = ModoAcao.nenhuma;

  void _setModo(ModoAcao modo) {
    setState(() => _modo = modo);
  }

  void _reset() {
    setState(() => _modo = ModoAcao.nenhuma);
  }

  void _abrirCamera() {
    if (_modo == ModoAcao.nenhuma) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecione uma ação primeiro!'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ScannerPage(modo: _modo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/ProCidadania.png"),
        fit: BoxFit.cover,
        alignment: Alignment.center,
  ),
),
        child: Container(
          color: Colors.black.withOpacity(0.05), // overlay escuro
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Pro-Cidadania – Frequência',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Selecione a função e toque em CÂMERA:',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      RoundedButton(
                        label: 'Presença',
                        icon: Icons.check_circle,
                        color: Colors.green,
                        active: _modo == ModoAcao.presenca,
                        onTap: () => _setModo(ModoAcao.presenca),
                      ),
                      RoundedButton(
                        label: 'Saída',
                        icon: Icons.logout,
                        color: Colors.orange,
                        active: _modo == ModoAcao.saida,
                        onTap: () => _setModo(ModoAcao.saida),
                      ),
                      RoundedButton(
                        label: 'Reset',
                        icon: Icons.refresh,
                        color: Colors.red,
                        active: false,
                        onTap: _reset,
                      ),
                      RoundedButton(
                        label: 'Câmera',
                        icon: Icons.camera_alt,
                        color: Colors.grey,
                        active: false,
                        onTap: _abrirCamera,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

*/

import 'package:flutter/material.dart';
import '../services/modes.dart';
import '../widgets/rounded_button.dart';
import 'scanner_page.dart';
import 'login_page.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ModoAcao _modo = ModoAcao.nenhuma;

  void _setModo(ModoAcao modo) {
    setState(() => _modo = modo);
  }

  void _reset() {
    setState(() => _modo = ModoAcao.nenhuma);
  }

  void _abrirCamera() {
    if (_modo == ModoAcao.nenhuma) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecione uma ação primeiro!'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ScannerPage(modo: _modo),
      ),
    );
  }

  // LOGOUT
  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/ProCidadania.png"),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.05),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // 🔥 CONTEÚDO CENTRAL
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Pro-Cidadania – Frequência',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Selecione a função e toque em CÂMERA:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 30),

                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          alignment: WrapAlignment.center,
                          children: [
                            RoundedButton(
                              label: 'Presença',
                              icon: Icons.check_circle,
                              color: Colors.green,
                              active: _modo == ModoAcao.presenca,
                              onTap: () => _setModo(ModoAcao.presenca),
                            ),
                            RoundedButton(
                              label: 'Saída',
                              icon: Icons.logout,
                              color: Colors.orange,
                              active: _modo == ModoAcao.saida,
                              onTap: () => _setModo(ModoAcao.saida),
                            ),
                            RoundedButton(
                              label: 'Reset',
                              icon: Icons.refresh,
                              color: Colors.red,
                              active: false,
                              onTap: _reset,
                            ),
                            RoundedButton(
                              label: 'Câmera',
                              icon: Icons.camera_alt,
                              color: Colors.grey,
                              active: false,
                              onTap: _abrirCamera,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // 🔴 BOTÃO SAIR FIXO EMBAIXO
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _logout,
                      icon: const Icon(Icons.logout),
                      label: const Text('Sair'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}