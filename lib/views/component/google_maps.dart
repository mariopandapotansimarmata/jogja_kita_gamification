import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});

  @override
  State<GoogleMapView> createState() => GoogleMapViewState();
}

class GoogleMapViewState extends State<GoogleMapView> {
  late double latit;
  late double longt;
  bool _locationServiceEnabled = false;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  @override
  void initState() {
    super.initState();
    _getLocationPermissionAndPosition();
  }

  Future<void> _getLocationPermissionAndPosition() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        latit = position.latitude;
        longt = position.longitude;
        _locationServiceEnabled = true;
      });
    } catch (e) {
      setState(() {
        _locationServiceEnabled = false;
      });
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: _locationServiceEnabled
                ? GoogleMap(
                    markers: {
                      const Marker(
                        infoWindow: InfoWindow(title: "Mie Gacoan"),
                        markerId: MarkerId('Gacoan'),
                        position:
                            LatLng(-7.763562743392816, 110.39335519592109),
                      )
                    },
                    mapType: MapType.normal,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(-7.763562743392816, 110.39335519592109),
                      zoom: 16,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  )
                : const Center(
                    child: Text(
                      'Waiting for location...',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     _getLocationPermissionAndPosition();
          //   },
          //   child: const Text("Refresh Location"),
          // ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
