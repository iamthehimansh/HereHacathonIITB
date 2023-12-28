import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'dart:typed_data';

class MapRoute extends StatefulWidget {
  //

  MapRoute({Key? key}) : super(key: key);
  @override
  State<MapRoute> createState() => _MapRouteState();
}

class _MapRouteState extends State<MapRoute> {
  late HereMapController _hereMapController;
  double long = 0;
  double lat = 0;

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    long = arg['longitude'];
    lat = arg['latitude'];
    return HereMap(
      onMapCreated: _onMapCreated,
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    _hereMapController = hereMapController;
    // hereMapController.mapScene.enableFeatures(
    //     {MapFeatures.landmarks: MapFeatureModes.landmarksTextured});

    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.satellite,
        (MapError? error) {
      if (error != null) {
        print('Map scene not loaded. MapError: ${error.toString()}');
        return;
      }
      addMapMarker(GeoCoordinates(lat, long));
      const double distanceToEarthInMeters = 500;
      MapMeasure mapMeasureZoom =
          MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);
      hereMapController.camera
          .lookAtPointWithMeasure(GeoCoordinates(lat, long), mapMeasureZoom);
    });
  }

  Future<void> addMapMarker(GeoCoordinates geoCoordinates) async {
    // Reuse existing MapImage for new map markers.
    Uint8List imagePixelData = await _loadFileAsUint8List('assets/pin.png');
    MapImage mapImage =
        MapImage.withPixelDataAndImageFormat(imagePixelData, ImageFormat.png);

    MapMarker mapMarker = MapMarker(geoCoordinates, mapImage);
    _hereMapController.mapScene.addMapMarker(mapMarker);
  }

  Future<Uint8List> _loadFileAsUint8List(String assetPathToFile) async {
    // The path refers to the assets directory as specified in pubspec.yaml.
    ByteData fileData = await rootBundle.load(assetPathToFile);
    return Uint8List.view(fileData.buffer);
  }
}
