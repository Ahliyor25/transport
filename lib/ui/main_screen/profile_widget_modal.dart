import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transport/ui/main_screen/geo_locator_widget.dart';
import 'package:transport/ui/theme/app_button_style.dart';
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
  // ignore: unused_field
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
    Future<Point> point = getPosition();
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
                    point: await point,
                    animation: const MapAnimation(duration: 1),
                    zoom: 15);
                await yandexMapController.addPlacemark(
                  Placemark(
                      point: await point,
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
                  body: const Text('dasd'),
                  panelBuilder: (sc) => _panel(sc),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0)),
                  onPanelSlide: (double pos) => setState(() {
                    _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                        _initFabHeight;
                  }),
                ),
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
