import 'package:flutter/material.dart';
import 'package:transport/ui/theme/app_colors.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.contain,
                // colorFilter: ColorFilter.linearToSrgbGamma(),
              ),
            ),
            child: Container(
              color: AppColors.blackOpacity30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 75),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Dushanbe Trans',
                    style: TextStyle(
                        fontSize: 26,
                        fontStyle: FontStyle.normal,
                        color: Colors.white)),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                    'Поможет найти транспорт и \nудобно спланировать маршрут',
                    style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'SanFrancisco-regular',
                        color: Colors.white)),
                const Expanded(
                    child: SizedBox(
                  height: 0,
                )),
                const Text(
                  'Карта со всем городским\nтранспортом у вас в кармане',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SanFrancisco-regular',
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 24,
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0x00F7F8F9).withOpacity(0.35),
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.only(top: 23, bottom: 23),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Что мы еще умеем?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.blueBase,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.only(top: 23, bottom: 23),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Начать пользоваться',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
