import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/data/mock_db.dart';
import 'driver_registration_screen.dart';

class ProfileScreen extends StatefulWidget {
  final VoidCallback onLogout;
  final bool isDriver;
  final bool isPilotMode;
  final VoidCallback onTogglePilotMode;

  const ProfileScreen({
    super.key,
    required this.onLogout,
    required this.isDriver,
    required this.isPilotMode,
    required this.onTogglePilotMode,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? _user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final user = await MockDB.getCurrentUser();
    setState(() {
      _user = user;
    });
  }

  void _becomeDriver(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const DriverRegistrationScreen()),
    );
  }

  void _shareReferralCode() {
    if (_user?['referralCode'] != null) {
      Clipboard.setData(ClipboardData(text: _user!['referralCode']));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Código copiado al portapapeles')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 16),
            Text(
              _user?['name'] ?? 'Usuario',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              _user?['email'] ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            
            // Código de referido
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tu Código de Referido',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _user?['referralCode'] ?? 'Cargando...',
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: _shareReferralCode,
                          icon: const Icon(Icons.share),
                          tooltip: 'Copiar código',
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Comparte este código para ganar comisiones en viajes.',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            if (widget.isDriver) ...[
              Card(
                elevation: 0,
                color: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Modo Piloto',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Switch(
                        value: widget.isPilotMode,
                        onChanged: (val) => widget.onTogglePilotMode(),
                        activeThumbColor: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],

            if (!widget.isDriver) ...[
              ElevatedButton.icon(
                onPressed: () => _becomeDriver(context),
                icon: const Icon(Icons.drive_eta),
                label: const Text('Convertirse en conductor'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],

            const Spacer(),

            ElevatedButton(
              onPressed: widget.onLogout,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Cerrar sesión'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}