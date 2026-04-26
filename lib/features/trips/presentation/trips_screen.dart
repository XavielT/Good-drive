import 'package:flutter/material.dart';

class TripsScreen extends StatelessWidget {
  final bool isDriver;
  const TripsScreen({super.key, required this.isDriver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Mis Viajes', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Esta semana', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          _buildTripCard(
            context,
            name: isDriver ? 'María García' : 'Roberto Mejía',
            date: 'Hoy, 14:20 PM',
            price: isDriver ? 'RD\$ 150.00' : 'RD\$ 150.00',
            status: 'Completado',
            statusColor: Colors.green,
            avatarUrl: isDriver ? 'https://i.pravatar.cc/100?img=5' : 'https://i.pravatar.cc/100?img=11',
          ),
          _buildTripCard(
            context,
            name: isDriver ? 'Carlos Mateo' : 'Elena Ramos',
            date: 'Ayer, 09:15 AM',
            price: isDriver ? 'RD\$ 220.00' : 'RD\$ 220.00',
            status: 'Completado',
            statusColor: Colors.green,
            avatarUrl: isDriver ? 'https://i.pravatar.cc/100?img=12' : 'https://i.pravatar.cc/100?img=9',
          ),
          
          const Padding(
            padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
            child: Text('Semana pasada', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          _buildTripCard(
            context,
            name: isDriver ? 'Luis Peña' : 'Marcos Ruiz',
            date: '18 de Octubre, 18:30 PM',
            price: isDriver ? 'RD\$ 180.00' : 'RD\$ 180.00',
            status: 'Cancelado',
            statusColor: Colors.red,
            avatarUrl: isDriver ? 'https://i.pravatar.cc/100?img=33' : 'https://i.pravatar.cc/100?img=59',
          ),
        ],
      ),
    );
  }

  Widget _buildTripCard(BuildContext context, {required String name, required String date, required String price, required String status, required Color statusColor, required String avatarUrl}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(avatarUrl), radius: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(isDriver ? 'Pasajero: $name' : 'Conductor: $name', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Container(
                    margin: const EdgeInsets.top(4),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(status, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Column(
                children: [
                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle)),
                  Container(width: 2, height: 20, color: Colors.grey.shade300),
                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle)),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Ágora Mall, Santo Domingo', style: TextStyle(fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
                    SizedBox(height: 14),
                    Text('Aeropuerto Las Américas (SDQ)', style: TextStyle(fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}