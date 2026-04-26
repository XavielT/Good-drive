import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../trips/presentation/active_trip_screen.dart';

class PassengerHomeScreen extends StatefulWidget {
  const PassengerHomeScreen({super.key});

  @override
  State<PassengerHomeScreen> createState() => _PassengerHomeScreenState();
}

class _PassengerHomeScreenState extends State<PassengerHomeScreen> {
  int proposedPrice = 150;
  String selectedRide = 'Sedán';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Map
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(18.4719, -69.9325), // Santo Domingo
              initialZoom: 15.0,
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
                    child: Icon(Icons.location_on, color: Colors.blue, size: 40),
                  ),
                  Marker(
                    point: LatLng(18.4820, -69.9390), // Agora Mall approx
                    child: Icon(Icons.location_on, color: Colors.green, size: 40),
                  ),
                ],
              ),
            ],
          ),

          // Safe Area for top items if needed, or back button
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              // We could put a top menu button here if we wanted
              child: SizedBox(), 
            ),
          ),

          // Bottom Sheet (Floating Card)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.95), // Slight glassmorphism effect
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Locations
                  Row(
                    children: [
                      const Icon(Icons.my_location, color: Colors.green),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Ubicación actual', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            Text('Av. Winston Churchill', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 20,
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.blue),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text('Ágora Mall, SD', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Ride Types
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildRideType('Sedán', Icons.directions_car, selectedRide == 'Sedán'),
                      _buildRideType('SUV', Icons.airport_shuttle, selectedRide == 'SUV'),
                      _buildRideType('Good+', Icons.electric_car, selectedRide == 'Good+'),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Price Setter
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const Text('PRECIO SUGERIDO: \$135 DOP', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12)),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (proposedPrice > 50) proposedPrice -= 10;
                                });
                              },
                              icon: const Icon(Icons.remove, color: Colors.blue),
                              style: IconButton.styleFrom(backgroundColor: Colors.white),
                            ),
                            const SizedBox(width: 20),
                            Text('\$$proposedPrice', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 20),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  proposedPrice += 10;
                                });
                              },
                              icon: const Icon(Icons.add, color: Colors.blue),
                              style: IconButton.styleFrom(backgroundColor: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Mostrar BottomSheet simulando ofertas de conductores
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (context) => _buildOffersSheet(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent.shade400,
                        foregroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Propón tu precio', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(width: 8),
                          Icon(Icons.bolt),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRideType(String name, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRide = name;
        });
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.withValues(alpha: 0.2) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? Border.all(color: Colors.green, width: 2) : Border.all(color: Colors.transparent, width: 2),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? Colors.green.shade700 : Colors.grey.shade600, size: 32),
            const SizedBox(height: 8),
            Text(name, style: TextStyle(color: isSelected ? Colors.green.shade700 : Colors.grey.shade600, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildOffersSheet() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 20),
          const Text('Ofertas de conductores', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _buildOfferItem('Roberto Mejía', 'Tesla Model 3', '4.9', '\$145', '2 min', 'https://i.pravatar.cc/100?img=11'),
          const Divider(),
          _buildOfferItem('Carlos M.', 'Honda Civic', '4.7', '\$150', '5 min', 'https://i.pravatar.cc/100?img=12'),
          const Divider(),
          _buildOfferItem('Elena R.', 'Kia Picanto', '4.8', '\$130', '8 min', 'https://i.pravatar.cc/100?img=5'),
        ],
      ),
    );
  }

  Widget _buildOfferItem(String name, String car, String rating, String price, String time, String avatarUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(avatarUrl), radius: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Row(
                  children: [
                    Text(car, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    const SizedBox(width: 8),
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    Text(rating, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green)),
              Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close bottom sheet
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ActiveTripScreen(isDriver: false)),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent.shade400,
              foregroundColor: Colors.black87,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            child: const Text('Aceptar', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
