import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget{
  const MapView({super.key});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView>{
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  Future<LatLng> getDeviceLocation() async {
    LatLng location = const LatLng(37.43296265331129, -122.08832357078792);
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);

    location = LatLng(position.latitude, position.longitude);

    return location;
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(40.41831, -3.70275),
    zoom: 14.4746,
  );

  CameraPosition getCamaraPosition(LatLng currentLocation){
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
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
    await controller.animateCamera(CameraUpdate.newCameraPosition(getCamaraPosition(deviceLocation)));
  }
}