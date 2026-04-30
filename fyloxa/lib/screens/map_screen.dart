import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  final String gymName;
  final double gymLat;
  final double gymLng;

  const MapScreen({
    super.key,
    required this.gymName,
    required this.gymLat,
    required this.gymLng,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? currentPos;
  GoogleMapController? mapController;

  final Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final userLatLng = LatLng(position.latitude, position.longitude);

    setState(() {
      currentPos = userLatLng;

      markers.add(
        Marker(
          markerId: const MarkerId("user"),
          position: userLatLng,
          infoWindow: const InfoWindow(title: "You are here"),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueBlue,
          ),
        ),
      );

      markers.add(
        Marker(
          markerId: const MarkerId("gym"),
          position: LatLng(widget.gymLat, widget.gymLng),
          infoWindow: InfoWindow(title: widget.gymName),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueRed,
          ),
        ),
      );
    });

    // ❌ OLD BUG FIXED: safe camera move
    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(widget.gymLat, widget.gymLng),
          15,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000814),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.gymName,
          style: const TextStyle(color: Colors.white),
        ),
      ),

      body: currentPos == null
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "Getting your location...",
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentPos!,
                zoom: 14,
              ),

              onMapCreated: (controller) {
                mapController = controller;

                // ✅ SAFE camera move after map ready
                mapController!.animateCamera(
                  CameraUpdate.newLatLngZoom(
                    LatLng(widget.gymLat, widget.gymLng),
                    15,
                  ),
                );
              },

              myLocationEnabled: true,
              myLocationButtonEnabled: true,

              markers: markers,
            ),
    );
  }
}