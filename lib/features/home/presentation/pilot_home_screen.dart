import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../trips/presentation/active_trip_screen.dart';

class PilotHomeScreen extends StatefulWidget {
  const PilotHomeScreen({super.key});

  @override
  State<PilotHomeScreen> createState() => _PilotHomeScreenState();
}

class _PilotHomeScreenState extends State<PilotHomeScreen> {
  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Map
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(18.4719, -69.9325), // Santo Domingo
              initialZoom: 14.5,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.good_drive',
              ),
              const MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(18.4719, -69.9325),
                    child: Icon(Icons.car_rental, color: Colors.green, size: 40),
                  ),
                ],
              ),
            ],
          ),

          // Top Overlay (Header & Online Switch)
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=11'),
                        radius: 24,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Good Drive',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.directions_car, size: 16, color: Colors.blue),
                            SizedBox(width: 6),
                            Text('10 viajes\nrestantes', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.notifications_none, size: 28),
                    ],
                  ),
                ),
                // Toggle Online/Offline
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isOnline = true),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isOnline ? Colors.green : Colors.transparent,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                'ESTOY ONLINE',
                                style: TextStyle(
                                  color: isOnline ? Colors.white : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isOnline = false),
                          child: Container(
                            decoration: BoxDecoration(
                              color: !isOnline ? Colors.grey.shade300 : Colors.transparent,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                'OFFLINE',
                                style: TextStyle(
                                  color: !isOnline ? Colors.black : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Sheet (Ride Request)
          if (isOnline)
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // High Demand Badge
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [BoxShadow(color: Colors.blue.withValues(alpha: 0.5), blurRadius: 10, offset: const Offset(0, 4))],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.trending_up, color: Colors.white, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Alta demanda en Piantini (+ \$50 DOP)',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.chevron_right, color: Colors.white, size: 18),
                      ],
                    ),
                  ),

                  // Ride Request Card
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.95),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 20, spreadRadius: 5)],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Passenger Info & Price
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=5'),
                              radius: 24,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('María García', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                  Row(
                                    children: const [
                                      Icon(Icons.star, color: Colors.amber, size: 16),
                                      SizedBox(width: 4),
                                      Text('4.9 • 2.4 km', style: TextStyle(color: Colors.grey, fontSize: 14)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text('\$250.00', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 24)),
                                Text('PROPUESTA', style: TextStyle(color: Colors.grey, fontSize: 10, letterSpacing: 1)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        const SizedBox(height: 12),

                        // Route Info
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.location_on, color: Colors.green, size: 20),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Recogida', style: TextStyle(color: Colors.grey, fontSize: 12)),
                                  Text('Av. Winston Churchill', style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.near_me, color: Colors.blue, size: 20),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Destino', style: TextStyle(color: Colors.grey, fontSize: 12)),
                                  Text('Aeropuerto Las Américas', style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Action Buttons
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade200,
                                  foregroundColor: Colors.black87,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  elevation: 0,
                                ),
                                child: const Text('Rechazar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => const ActiveTripScreen(isDriver: true)),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.greenAccent.shade400,
                                  foregroundColor: Colors.black87,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  elevation: 0,
                                ),
                                child: const Text('Aceptar Viaje', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
