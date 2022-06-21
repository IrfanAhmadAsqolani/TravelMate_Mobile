import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelmate/models/models.dart';

import '../../utils/utils.dart';

String mapsPageRoute = '/maps';

class MapsPage extends StatelessWidget {
  MapsPage({Key? key}) : super(key: key);

  final MapsParam args = Get.arguments as MapsParam? ?? const MapsParam();

  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps: ${args.locationName ?? ''}'),
        backgroundColor: CustomColors.white,
        foregroundColor: CustomColors.black,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(args.latitude ?? 0, args.longitude ?? 0),
          zoom: 25.0,
        ),
      ),
    );
  }
}
