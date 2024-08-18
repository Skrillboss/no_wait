import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  bool _hasLocationPermission = false;

  Future<LatLng> getDeviceLocation() async {
    LatLng location = const LatLng(37.43296265331129, -122.08832357078792);
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Position position =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);

    location = LatLng(position.latitude, position.longitude);

    return location;
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(40.41831, -3.70275),
    zoom: 14.4746,
  );

  CameraPosition getCamaraPosition(LatLng currentLocation) {
    return CameraPosition(
        bearing: 192.8334901395799,
        target: currentLocation,
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
  }

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    PermissionStatus status = await Permission.location.request();

    setState(() {
      _hasLocationPermission = status == PermissionStatus.granted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _hasLocationPermission
          ? GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            )
          : Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green, Colors.blue],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft),
              ),
              child: const Center(
                child: Text(
                  'Necesito los permisos de la cámara para continuar.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToMyLocation,
        label: const Text('Go to my Location!'),
        icon: const Icon(Icons.location_on),
      ),
    );
  }

  Future<void> _goToMyLocation() async {
    final LatLng deviceLocation = await getDeviceLocation();
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
        CameraUpdate.newCameraPosition(getCamaraPosition(deviceLocation)));
  }
}
