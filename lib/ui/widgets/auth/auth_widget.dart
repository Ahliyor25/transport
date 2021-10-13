import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transport/ui/theme/app_colors.dart';
import 'package:transport/ui/widgets/auth/check_code_widget.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key}) : super(key: key);
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
                fit: BoxFit.scaleDown,
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
                const Text('Регистрация',
                    style: TextStyle(
                        fontSize: 26,
                        fontStyle: FontStyle.normal,
                        color: Colors.white)),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                    'Еще один шаг до самых быстрых\nпоездков в вашей жизни',
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
                  'Введите номер телефона',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'Вам придёт смс с кодом подтверждения',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 24,
                ),
                FractionallySizedBox(
                    widthFactor: 1,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      autocorrect: false,
                      style: TextStyle(
                        color: AppColors.black,
                      ),
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        labelText: 'Phone Number',
                        hintText: 'Введите номер телефона',
                        labelStyle: TextStyle(color: AppColors.backColor),
                        prefixIcon: Icon(Icons.phone),
                        prefix: Text(
                          '+992 ',
                          style: TextStyle(color: AppColors.blueBase),
                        ),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                        focusColor: AppColors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    )),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const CheckCodeWidget();
                        }),
                      );
                    },
                    child: const Text(
                      'Отправить код',
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
