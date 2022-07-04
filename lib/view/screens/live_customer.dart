import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.6868283, 85.3357083),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      //target: LatLng(37.43296265331129, -122.08832357078792),
      target: LatLng(27.6868283, 85.3357083),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  /////////////////////////////////marker
  final List<Marker> _marker = [];

  @override
  void initState() {
    super.initState();

    List<Marker> list = [
      Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueMagenta),
          markerId: const MarkerId('1'),
          position: const LatLng(27.6868283, 85.3357083),
          infoWindow: const InfoWindow(title: 'My Position')),
      // Marker(
      //     icon:
      //         BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      //     markerId: const MarkerId('2'),
      //     position: LatLng(latt, longg),
      //     infoWindow: const InfoWindow(title: 'Kalanki')),
      Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
          markerId: const MarkerId('2'),
          position: const LatLng(27.6868, 85.33),
          infoWindow: const InfoWindow(title: 'Dynamic')),
      Marker(
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
          markerId: const MarkerId('3'),
          position: const LatLng(27.684459, 85.3148378),
          infoWindow: const InfoWindow(title: 'PCPS College')),
      Marker(
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          markerId: const MarkerId('3'),
          position: const LatLng(27.6933824, 85.3187376),
          infoWindow: const InfoWindow(title: 'Sandesh College')),
    ];
    _marker.addAll(list);
  }

  ///      /////////////////////////////////marker

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Live Colleague",
        ),
      ),
      body: GoogleMap(
        markers: Set<Marker>.of(_marker),
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        // myLocationButtonEnabled: true,
        myLocationEnabled: true,
        compassEnabled: true,
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

/////////////////////Geo///////// LOcacator
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
