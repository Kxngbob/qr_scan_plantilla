import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scan/model/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    final CameraPosition _puntInicial = CameraPosition(
      target: LatLng(40.689247, -74.044502),
      zoom: 14.4746,
    );
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _puntInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
