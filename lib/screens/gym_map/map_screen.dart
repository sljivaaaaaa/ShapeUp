import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  // Coordinates of Skopje, Macedonia
  final LatLng skopjeCoordinates = LatLng(41.9973, 21.4280);

  // Gym locations
  final List<LatLng> gymLocations = [
    LatLng(42.009580563983, 21.426412876601862),
    LatLng(42.00492968883467, 21.38384073339241),
    LatLng(41.998551400237474, 21.451818636781244),
    LatLng(41.99287905850388, 21.43465237665689),

    LatLng(41.99670644950957, 21.395170261052264),
    LatLng(42.00869745084955, 21.396543552029815),
    LatLng(41.99594098972171, 21.415082980226767),

    LatLng(41.98092479899404, 21.4391609711503),
    LatLng(41.992752624812155, 21.44654897268892),
    LatLng(42.02675811837329, 21.442217319379207),

    LatLng(42.00633338507618, 21.4625485823092),
    LatLng(41.98718975861111, 21.436366847786815),
    LatLng(41.99512286828502, 21.423024886927433),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check out workout places'),
        backgroundColor: Colors.pink[100],
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: skopjeCoordinates, // Skopje's coordinates
          zoom: 13.0,
        ),
        markers: gymLocations.map((latLng) {
          return Marker(
            markerId: MarkerId(latLng.toString()),
            position: latLng,
            infoWindow: InfoWindow(title: 'Gym', snippet: 'Gym Description'),
          );
        }).toSet(),
      ),
    );
  }
}
