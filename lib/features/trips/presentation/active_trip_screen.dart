import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/data/mock_db.dart';
import 'post_trip_screen.dart';

class ActiveTripScreen extends StatelessWidget {
  final bool isDriver;
  const ActiveTripScreen({super.key, required this.isDriver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Map
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(18.4750, -69.9350), // Somewhere in Santo Domingo
              initialZoom: 16.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.good_drive',
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: const [
                      LatLng(18.4719, -69.9325),
                      LatLng(18.4750, -69.9350),
                      LatLng(18.4820, -69.9390),
                    ],
                    color: Colors.green,
                    strokeWidth: 4.0,
                    // isDotted: true, // flutter_map 6+ doesn't have isDotted directly on Polyline sometimes, using simple line
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: const LatLng(18.4750, -69.9350), // Current pos
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: [BoxShadow(color: Colors.green.withOpacity(0.5), blurRadius: 10, spreadRadius: 5)],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Safe Area Top Card
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // ETA Card
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(isDriver ? 'NAVEGANDO HACIA DESTINO' : 'EN CAMINO AL DESTINO', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1)),
                              const SizedBox(height: 4),
                              const Text('8 min • 2.4 km', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                              const SizedBox(height: 8),
                              // Progress bar placeholder
                              Container(
                                height: 4,
                                width: 150,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [Colors.green, Colors.lightGreenAccent]),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.local_hospital, color: Colors.red, size: 20), // SOS / emergency icon placeholder
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Map Control Buttons (Right Side)
          Positioned(
            right: 16,
            bottom: isDriver ? 280 : 320,
            child: Column(
              children: [
                _buildMapBtn(Icons.add),
                const SizedBox(height: 8),
                _buildMapBtn(Icons.my_location),
                const SizedBox(height: 8),
                _buildMapBtn(Icons.chat_bubble_outline, bgColor: Colors.blue.shade700, iconColor: Colors.white),
              ],
            ),
          ),

          // Bottom Sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, -5))],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle bar
                  Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: 20),

                  // User Info
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(isDriver ? 'https://i.pravatar.cc/100?img=5' : 'https://i.pravatar.cc/100?img=11'),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(isDriver ? 'María García' : 'Roberto Mejía', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                            Text(isDriver ? 'Pasajero' : 'Tesla Model 3 • ABC-1234', style: const TextStyle(color: Colors.grey, fontSize: 14)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.grey.shade100, shape: BoxShape.circle),
                        child: const Icon(Icons.call, color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Details Row
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Row(
                                children: [
                                  Icon(Icons.money, size: 16, color: Colors.grey),
                                  SizedBox(width: 4),
                                  Text('PAGO AL FINALIZAR', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text('\$120.50', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              Text('Efectivo', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Row(
                                children: [
                                  Icon(Icons.access_time, size: 16, color: Colors.blue),
                                  SizedBox(width: 4),
                                  Text('LLEGADA ESTIMADA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.blue)),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text('14:45', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)),
                              Text('PM', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Quick actions / Main Action
                  if (!isDriver) ...[
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildQuickChat('¿Dónde estás?'),
                          const SizedBox(width: 8),
                          _buildQuickChat('Ya voy saliendo'),
                          const SizedBox(width: 8),
                          _buildQuickChat('Te veo allí'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.share),
                        label: const Text('Compartir viaje en tiempo real', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent.shade400,
                          foregroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                        ),
                      ),
                    ),
                  ] else ...[
                    // Driver actions
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          // Simular finalizar viaje
                          await MockDB.completeTrip(120.50);
                          
                          if (context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => const PostTripScreen()),
                            );
                          }
                        },
                        icon: const Icon(Icons.check_circle),
                        label: const Text('Completar Viaje', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapBtn(IconData icon, {Color bgColor = Colors.white, Color iconColor = Colors.black87}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle, boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: Icon(icon, color: iconColor),
    );
  }

  Widget _buildQuickChat(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
