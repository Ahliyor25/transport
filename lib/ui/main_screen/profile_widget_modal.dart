import 'dart:ui';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transport/ui/theme/appButtonStyle.dart';
import 'package:transport/ui/theme/app_colors.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late YandexMapController controller;
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  final double _panelHeightClosed = 180.0;
  

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .30;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(8),
            child: YandexMap(
              onMapCreated: (YandexMapController yandexMapController) async {
                controller = yandexMapController;

                await controller.move(
                    point: const Point(latitude: 38.53575, longitude: 68.77905),
                    animation: const MapAnimation(duration: 2),
                    zoom: 11);
                await yandexMapController.addPlacemark(
                  Placemark(
                      point:
                          const Point(latitude: 38.53575, longitude: 68.77905),
                      style: const PlacemarkStyle(
                          iconName: 'assets/images/place.png', scale: 0.75)),
                );
              },
            ),
          )),
          Material(
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                SlidingUpPanel(
                  maxHeight: _panelHeightOpen,
                  minHeight: _panelHeightClosed,
                  parallaxEnabled: true,
                  parallaxOffset: .5,
                  body: Text('dasd'),
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
          ),
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
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
                const Expanded(
                    child: SizedBox(
                  height: 5,
                )),
                ElevatedButton(
                  style: AppButtonStyle.linkButton,
                  onPressed: () {},
                  child: const Text(
                    'Пополнить',
                    style: TextStyle(color: AppColors.blueBase, fontSize: 18),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24.0),
            const Text(
                'Привяжите карты Dushanbe City\nи следите за остатком и легко пополняйте её')
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
                fontFamily: '',
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w400)),
        SizedBox(
          height: 5,
        ),
        Text(
          '256с',
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'SanFrancisco',
              fontWeight: FontWeight.w700,
              color: AppColors.blueBase),
        )
      ],
    );
  }
}
