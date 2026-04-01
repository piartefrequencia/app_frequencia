

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../services/api_client.dart';
import '../services/modes.dart';

class ScannerPage extends StatefulWidget {
  final ModoAcao modo;

  const ScannerPage({
    super.key,
    required this.modo,
  });

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  bool _processing = false;
  bool _loading = false;

  final MobileScannerController _controller = MobileScannerController();

  int? parseId(String raw) {
    final regex = RegExp(r'ALUNO:(\d+)');
    final match = regex.firstMatch(raw);

    if (match != null) {
      return int.tryParse(match.group(1)!);
    }

    return null;
  }

  Future<bool> _temInternet() async {
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  Future<void> onDetect(BarcodeCapture capture) async {
    if (_processing) return;

    _processing = true;
    setState(() => _loading = true);

    await _controller.stop();

    try {
      //  Verifica internet
      final temInternet = await _temInternet();
      if (!temInternet) {
        _snack('Sem internet ❌');
        Navigator.pop(context);
        return;
      }

      if (widget.modo == ModoAcao.nenhuma) {
        _snack('Escolha PRESENÇA ou FIM DAS AULAS.');
        Navigator.pop(context);
        return;
      }

      final code = capture.barcodes.first.rawValue ?? '';
      final alunoId = parseId(code);

      if (alunoId == null) {
        _snack('QR inválido ❌');
        Navigator.pop(context);
        return;
      }

      final ok = await ApiClient.registrar(
        alunoId: alunoId,
        tipo: widget.modo.label,
      );

      _snack(ok ? 'Registro OK ✅' : 'Erro ao registrar ❌');
      Navigator.pop(context);
    } catch (e) {
      _snack('Erro inesperado ❌');
      Navigator.pop(context);
    } finally {
      setState(() => _loading = false);
      _processing = false;
    }
  }

  void _snack(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner - ${widget.modo.label}'),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _controller,
            onDetect: onDetect,
          ),

          // Área de foco
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 3),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          // LOADING
          if (_loading)
            Container(
              color: Colors.black54,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}



/*  1 Versão

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../services/api_client.dart';
import '../services/modes.dart';

class ScannerPage extends StatefulWidget {
  final ModoAcao modo;

  const ScannerPage({
    super.key,
    required this.modo,
  });

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  bool _processing = false;

  int? parseId(String raw) {
    final regex = RegExp(r'ALUNO:(\d+)');
    final match = regex.firstMatch(raw);

    if (match != null) {
      return int.tryParse(match.group(1)!);
    }

    return null;
  }

  Future<void> onDetect(BarcodeCapture capture) async {
    if (_processing) return;

    _processing = true;

    if (widget.modo == ModoAcao.nenhuma) {
      _snack('Escolha PRESENÇA ou FIM DAS AULAS.');
      Navigator.pop(context);
      return;
    }

    final code = capture.barcodes.first.rawValue ?? '';
    final alunoId = parseId(code);

    if (alunoId == null) {
      _snack('QR inválido');
      Navigator.pop(context);
      return;
    }

    final ok = await ApiClient.registrar(
      alunoId: alunoId,
      tipo: widget.modo.label,
    );

    _snack(ok ? 'Registro OK!' : 'Erro ao registrar');
    Navigator.pop(context);
  }

  void _snack(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner - ${widget.modo.label}'),
      ),
      body: MobileScanner(
        onDetect: onDetect,
      ),
    );
  }
}

*/