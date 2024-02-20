import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoService {
  static const String _kLocationServicesDisabledMessage =
      'Location services are disabled.';
  static const String _kPermissionDeniedMessage = 'Permission denied.';
  static const String _kPermissionDeniedForeverMessage =
      'Permission denied forever.';
  static const String _kPermissionGrantedMessage = 'Permission granted.';

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  final List<_PositionItem> _positionItems = <_PositionItem>[];
  StreamSubscription<Position>? _positionStreamSubscription;
  StreamSubscription<ServiceStatus>? _serviceStatusStreamSubscription;
  bool positionStreamStarted = false;

  // Future<void> _getCurrentPosition() async {
  //   final hasPermission = await _handlePermission();

  //   if (!hasPermission) {
  //     return;
  //   }

  //   final position = await _geolocatorPlatform.getCurrentPosition();
  //   print(position);
  //   _updatePositionList(
  //     _PositionItemType.position,
  //     position.toString(),
  //   );
  // }

  Future<LatLng> getCurrentPosition() async {
  final hasPermission = await _handlePermission();

  if (!hasPermission) {
    // Handle lack of permission here if needed
    throw Exception();
  }
  
  final position = await _geolocatorPlatform.getCurrentPosition();

  // Convert Position to LatLng
  LatLng centerLatLng = positionToLatLng(position);

  // Print the LatLng coordinates
  print("Center Latitude: ${centerLatLng.latitude}, Longitude: ${centerLatLng.longitude}");

  // Update your position list or perform other actions if needed

  return centerLatLng;
}

LatLng positionToLatLng(Position position) {
  return LatLng(position.latitude, position.longitude);
}

  void _updatePositionList(_PositionItemType type, String displayValue) {
    _positionItems.add(_PositionItem(type, displayValue));
    //setState(() {});
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      _updatePositionList(
        _PositionItemType.log,
        _kLocationServicesDisabledMessage,
      );

      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        _updatePositionList(
          _PositionItemType.log,
          _kPermissionDeniedMessage,
        );

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      _updatePositionList(
        _PositionItemType.log,
        _kPermissionDeniedForeverMessage,
      );

      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    _updatePositionList(
      _PositionItemType.log,
      _kPermissionGrantedMessage,
    );
    return true;
  }
}

enum _PositionItemType {
  log,
  position,
}

class _PositionItem {
  _PositionItem(this.type, this.displayValue);

  final _PositionItemType type;
  final String displayValue;
}

class DistanceCalculator {
  Future<double> calculateDistance(Position position1, Position position2) async {
    double distance = await Geolocator.distanceBetween(
      position1.latitude,
      position1.longitude,
      position2.latitude,
      position2.longitude,
    );

    // The distance is in meters. You can convert it to other units if needed.
    return distance;
  }
}

// Example usage:
void main() async {
  DistanceCalculator distanceCalculator = DistanceCalculator();

  // Get positions for two devices (replace these with actual positions)
  Position device1Position = await Geolocator.getCurrentPosition();
  Position device2Position = await Geolocator.getCurrentPosition();

  // Calculate distance
  double distance = await distanceCalculator.calculateDistance(
    device1Position,
    device2Position,
  );

  print("Distance between devices: $distance meters");
}
