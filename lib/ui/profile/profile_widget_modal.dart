import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transport/ui/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  final double _panelHeightClosed = 200.0;

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;

    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: Text('ds'),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),
          // the fab
          // Positioned(
          //   right: 20.0,
          //   bottom: _fabHeight + 100,
          //   child: FloatingActionButton(
          //     child: Icon(
          //       Icons.gps_fixed,
          //       color: Theme.of(context).primaryColor,
          //     ),
          //     onPressed: () {},
          //     backgroundColor: Colors.white,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          controller: sc,
          children: <Widget>[
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 5,
                  decoration: const BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                _text(),
                
              ],
            ),
            const SizedBox(height: 36.0),
          ],
        ));
  }

  // Widget _body() {
  //   // return FlutterMap(
  //   //   options: MapOptions(
  //   //     center: LatLng(40.441589, -80.010948),
  //   //     zoom: 13,
  //   //     maxZoom: 15,
  //   //   ),
  //   //   layers: [
  //   //     TileLayerOptions(
  //   //         urlTemplate: "https://maps.wikimedia.org/osm-intl/{z}/{x}/{y}.png"),
  //   //     MarkerLayerOptions(markers: [
  //   //       Marker(
  //   //           point: LatLng(40.441753, -80.011476),
  //   //           builder: (ctx) => Icon(
  //                   Icons.location_on,
  //                   color: Colors.blue,
  //                   size: 48.0,
  //                 ),
  //             height: 60),
  //       ]),
  //     ],
  //   );
  // }
  Widget _text() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Баланс для поездок',
            style: TextStyle(
                fontFamily: '', fontSize: 16, color: AppColors.black)),
        SizedBox(
          height: 10,
        ),
        Text(
          '256с',
          style: TextStyle(
              fontSize: 16,
              fontFamily: 'SanFrancisco',
              fontWeight: FontWeight.w700,
              color: AppColors.blueBase),
        )
      ],
    );
  }
}
