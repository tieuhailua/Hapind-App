// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:hapind/service/geo_service.dart';

// class MapsDemo extends StatefulWidget {
//   static String routeName = "/maps_demo";
//   const MapsDemo({super.key});

//   @override
//   State<MapsDemo> createState() => _MyAppState();
// }

// class _MyAppState extends State<MapsDemo> {
//   late GoogleMapController mapController;
//   final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
//   Future<LatLng>? _center;
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
//   GeoService _geoService = GeoService();
  
//   @override
//   void initState()  {
//     super.initState();
//       _center = _geoService.getCurrentPosition();
//       print(_center);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: Colors.green[700],
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Maps Sample App'),
//           elevation: 2,
//         ),
//         body: GoogleMap(
//           onMapCreated: _onMapCreated,
//           initialCameraPosition: CameraPosition(
//             target: _center,
//             zoom: 11.0,
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:hapind/service/geo_service.dart';

// class MapsDemo extends StatefulWidget {
//   static String routeName = "/maps_demo";
//   const MapsDemo({super.key});

//   @override
//   State<MapsDemo> createState() => _MyAppState();
// }

// class _MyAppState extends State<MapsDemo> {
//   late GoogleMapController mapController;
//   final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
//   GeoService _geoService = GeoService();
//   late LatLng center;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: Colors.green[700],
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Maps Sample App'),
//           elevation: 2,
//         ),
//         body: FutureBuilder<LatLng>(
//           future: _geoService.getCurrentPosition(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               // If the Future is still running, show a loading indicator
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               // If there is an error, display an error message
//               return Text('Error: ${snapshot.error}');
//             } else {
//               // If the Future is complete, set the LatLng value to the GoogleMap
//               center = snapshot.data!;
//               //LatLng center=LatLng(37.7749, -122.4194);
//               return GoogleMap(
//                 onMapCreated: _onMapCreated,
//                 initialCameraPosition: CameraPosition(
//                   target: center,
//                   zoom: 11.0,
//                 ),
//                  markers: _createMarkers(),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
// }

// Set<Marker> _createMarkers() {
//   return <Marker>[
//     Marker(
//       markerId: MarkerId('marker1'),
//       position: LatLng(37.7749, -122.4194), // Replace with the marker's position
//       infoWindow: InfoWindow(
//         title: 'Marker 1',
//         snippet: 'This is marker 1',
//       ),
//       icon: BitmapDescriptor.defaultMarker, // You can customize the marker icon
//     ),
//     Marker(
//       markerId: MarkerId('marker2'),
//       position: LatLng(37.7755, -122.4199), // Replace with the marker's position
//       infoWindow: InfoWindow(
//         title: 'Marker 2',
//         snippet: 'This is marker 2',
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
//     ),
//     // Add more markers as needed
//   ].toSet();
// }

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';


// class MapsDemo extends StatefulWidget {
//   static String routeName = "/maps_demo";
//   const MapsDemo({super.key});

//   @override
//   State<MapsDemo> createState() => _MyAppState();
// }

// class _MyAppState extends State<MapsDemo> {
//   late GoogleMapController mapController;

//   final LatLng _center = const LatLng(45.521563, -122.677433);

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: Colors.green[700],
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Maps Sample App'),
//           elevation: 2,
//         ),
//         body: GoogleMap(
//           onMapCreated: _onMapCreated,
//           initialCameraPosition: CameraPosition(
//             target: _center,
//             zoom: 11.0,
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:hapind/service/geo_service.dart';

// class MapsDemo extends StatefulWidget {
//   static String routeName = "/maps_demo";
//   const MapsDemo({super.key});

//   @override
//   State<MapsDemo> createState() => _MyAppState();
// }

// class _MyAppState extends State<MapsDemo> {
//   late GoogleMapController mapController;
//   final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
//   GeoService _geoService = GeoService();
//   late LatLng center;
//   Set<Marker> markers = {};

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: Colors.green[700],
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Maps Sample App'),
//           elevation: 2,
//         ),
//         body: FutureBuilder<LatLng>(
//           future: _geoService.getCurrentPosition(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               // If the Future is still running, show a loading indicator
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               // If there is an error, display an error message
//               return Text('Error: ${snapshot.error}');
//             } else {
//               // If the Future is complete, set the LatLng value to the GoogleMap
//               center = snapshot.data!;
//               return GoogleMap(
//                 onMapCreated: _onMapCreated,
//                 initialCameraPosition: CameraPosition(
//                   target: center,
//                   zoom: 256.0,
//                 ),
//                 markers: markers,
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }

//    void _onMapCreated(GoogleMapController controller) async {
//     mapController = controller;
//     setState(() {
//       markers.add(Marker(
//         markerId: MarkerId('marker1'),
//         position: center,
//         infoWindow: InfoWindow(title: 'San Francisco'),
//       ));
//     });
//      await _getUserLocation();
//   }

//   Future<void> _getUserLocation() async {
//     setState(() {
//       markers.add(Marker(
//         markerId: MarkerId('userLocation'),
//         position: center,
//         infoWindow: InfoWindow(title: 'Your Location'),
//       ));
//     });
//   }

  // Set<Marker> _createMarkers() {
  //   return <Marker>[
  //     Marker(
  //       markerId: MarkerId('marker1'),
  //       position: LatLng(37.7749, -122.4194),
  //       infoWindow: InfoWindow(
  //         title: 'Marker 1',
  //         snippet: 'This is marker 1',
  //       ),
  //       icon: BitmapDescriptor.defaultMarker,
  //     ),
  //     Marker(
  //       markerId: MarkerId('marker2'),
  //       position: LatLng(37.7755, -122.4199),
  //       infoWindow: InfoWindow(
  //         title: 'Marker 2',
  //         snippet: 'This is marker 2',
  //       ),
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
  //     ),
  //     // Add more markers as needed
  //   ].toSet();
  // }
//}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hapind/service/geo_service.dart';

class MapsDemo extends StatefulWidget {
  static String routeName = "/maps_demo";
  const MapsDemo({super.key});

  @override
  State<MapsDemo> createState() => _MyAppState();
}

class _MyAppState extends State<MapsDemo> {
  late GoogleMapController mapController;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  GeoService _geoService = GeoService();
  late LatLng center;
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          elevation: 2,
        ),
        body: FutureBuilder<LatLng>(
          future: _geoService.getCurrentPosition(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // If the Future is still running, show a loading indicator
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // If there is an error, display an error message
              return Text('Error: ${snapshot.error}');
            } else {
              // If the Future is complete, set the LatLng value to the GoogleMap
              center = snapshot.data!;
              return GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: center,
                  zoom: 200.0,
                ),
                markers: markers,
              );
            }
          },
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _initializeMarkers();
  }

  void _initializeMarkers() {
    if (markers.isEmpty) {
      setState(() {
        markers.add(Marker(
          markerId: MarkerId('marker1'),
          position: center,
          infoWindow: InfoWindow(title: 'San Francisco'),
        ));
      });
    }
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    if (markers.where((marker) => marker.markerId == MarkerId('userLocation')).isEmpty) {
      setState(() {
        markers.add(Marker(
          markerId: MarkerId('userLocation'),
          position: center,
          infoWindow: InfoWindow(title: 'Your Location'),
        ));
      });
    }
  }
}

