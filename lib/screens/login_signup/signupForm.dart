import 'package:flutter/material.dart';
import "package:salahlypackage/screens/myLocation/getLocationComponent.dart";
import 'package:salahlypackage/widgets/login_signup/Rounded_Bottom.dart';
import 'package:salahlypackage/widgets/login_signup/Rounded_password.dart';
import 'package:salahlypackage/widgets/login_signup/Rouned-Input.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';


class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
    required this.defaultlogin,
  }) : super(key: key);

  final double defaultlogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: defaultlogin,
      //color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   'Welcome Back',
          //   style:TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontSize: 24,
          //   ),
          // ),
          SizedBox(height: 40),
          Image.asset('assets/images/logo ta5arog 2.png'),
          //SvgPicture.assets('assets/images/icon.svg'),
          SizedBox(height: 40),
          RounedInput(icon: Icons.face, hint: 'username'.tr()),
          RounedInput(icon: Icons.email, hint: 'email'.tr()),
          RounedPasswordInput(
            hint: 'password'.tr(),
          ),
          RounedPasswordInput(
            hint: 'confirm_password'.tr(),
          ),
          RounedInput(icon: Icons.phone, hint: 'phone_number'.tr()),
          SizedBox(height: 10),
          RoundedButton(title: 'sign_up'.tr(),
            onPressedFunction: (){
          }
          ,)
        ],
      ),
    );
  }
}
