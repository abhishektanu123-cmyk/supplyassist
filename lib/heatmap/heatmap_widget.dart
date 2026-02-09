import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HeatmapWidget extends StatefulWidget {
  const HeatmapWidget({super.key});

  static String routeName = 'Heatmap';
  static String routePath = '/heatmap';

  @override
  State<HeatmapWidget> createState() => _HeatmapWidgetState();
}

class _HeatmapWidgetState extends State<HeatmapWidget> {
  final Set<Circle> _heatCircles = {};

  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(50.1109, 8.6821), // Europe center
    zoom: 5.5,
  );

  @override
  void initState() {
    super.initState();
    _loadSupplierHeatData();
  }

  Color _riskColor(int risk) {
    if (risk >= 70) return Colors.red.withOpacity(0.45);
    if (risk >= 40) return Colors.orange.withOpacity(0.40);
    return Colors.green.withOpacity(0.35);
  }

  Future<void> _loadSupplierHeatData() async {
    final snapshot =
    await FirebaseFirestore.instance.collection('suppliers').get();

    for (var doc in snapshot.docs) {
      final data = doc.data();

      if (data['lat'] == null || data['lng'] == null) continue;

      final lat = (data['lat'] as num).toDouble();
      final lng = (data['lng'] as num).toDouble();
      final risk = (data['riskScore'] ?? 0) as int;
      final name = data['name'] ?? 'Supplier';

      final position = LatLng(lat, lng);



      _heatCircles.add(
        Circle(
          circleId: CircleId(doc.id),
          center: position,
          radius: 90000, // ✅ EU scale
          fillColor: _riskColor(risk),
          strokeColor: Colors.transparent,
        ),
      );
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supply Risk Heatmap'),
        backgroundColor: Colors.black,
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        circles: _heatCircles,
        zoomControlsEnabled: true,
      ),
    );
  }
}
