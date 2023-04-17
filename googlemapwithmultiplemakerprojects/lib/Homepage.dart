import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}
//AIzaSyDg_8Px5zGaHLF6JRQAp-fBDX2id7am6JY
class _HomepageState extends State<Homepage> {
   GoogleMapController? mapController; //contrller for Google map

   Set<Marker> markers =  Set();
   bool isloading = true;
   static const LatLng showLocation = const LatLng(21.1702, 72.8311);
   getmarkers() async{
     await BitmapDescriptor.fromAssetImage(
       ImageConfiguration(),
       "img/location.png",
     ).then((markerbitmap) {
       Set<Marker> tepmarkers = Set();
       tepmarkers.add(Marker( //add second marker
         markerId: MarkerId(showLocation.toString()),
         position: LatLng(21.190769, 72.794006),
         infoWindow: InfoWindow( //popup info
           title: 'Marker Title Second ',
           snippet: 'My Custom Subtitle',
         ),
         icon: markerbitmap, //Icon for Marker
       ));
       tepmarkers.add(Marker( //add third marker
         markerId: MarkerId(showLocation.toString()),
         position: LatLng(21.228125, 72.833771),
         infoWindow: InfoWindow( //popup info
           title: 'Marker Title Third ',
           snippet: 'My Custom Subtitle',
         ),
         icon: markerbitmap,
       ));
       tepmarkers.add(Marker( //add third marker
         markerId: MarkerId(showLocation.toString()),
         position: LatLng(21.247180, 72.890880),
         infoWindow: InfoWindow( //popup info
           title: 'Marker Title Third ',
           snippet: 'My Custom Subtitle',
         ),
         icon: markerbitmap, //Icon for Marker
       ));
       setState(() {
         markers = tepmarkers;
         isloading = false;

       });
     });


   }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmarkers();

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Map")),
      body: (isloading)?CircularProgressIndicator():GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(
          target: showLocation,
          zoom: 14.4746,
        ),
        markers: markers,
        onMapCreated: (controller)
        {
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }

}
