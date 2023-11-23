import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_edu/Utils/constants/colors.dart';
import 'package:interactive_cares_edu/Utils/constants/image_paths.dart';
import 'package:interactive_cares_edu/Utils/constants/strings.dart';
import 'package:interactive_cares_edu/Utils/functions/hexColor.dart';
import 'package:interactive_cares_edu/Utils/routes/routs.dart';
import 'package:interactive_cares_edu/Utils/widgets/colorButton.dart';
import 'package:interactive_cares_edu/Utils/widgets/textField.dart';
import 'package:interactive_cares_edu/Utils/widgets/txtButton.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:interactive_cares_edu/Networks/services/firebaseEmailAuth.dart';

class signup_page extends StatelessWidget {
  signup_page({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String fullname = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          Image(height: 110, width: 110, image: AssetImage(logo_img))
              .box
              .roundedFull
              .make(),
          10.heightBox,
          Text(
            signup_now_txt,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          Text(
            fill_details_txt,
            style: TextStyle(fontSize: 13),
          ),
          30.heightBox,
          Form(
              key: _formKey,
              child: Column(
                children: [
                  textField(
                      labelTxt: full_name_txt,
                      obscureText: false,
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        fullname = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return valid_name_txt;
                        } else {
                          return null;
                        }
                      }),
                  20.heightBox,
                  textField(
                      labelTxt: email_txt,
                      obscureText: false,
                      prefixIcon: Icons.mail,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        email = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return valid_email_txt;
                        } else {
                          return null;
                        }
                      }),
                  20.heightBox,
                  textField(
                      labelTxt: password_txt,
                      obscureText: true,
                      prefixIcon: Icons.lock,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        password = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty ||
                            value.length < 6 ||
                            value.length > 10) {
                          return valid_password_txt;
                        } else {
                          return null;
                        }
                      }),
                  15.heightBox,
                  colorButton(
                      txt: login_txt,
                      height: 35.0,
                      width: 200.0,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          if (await firebaseEmailAuth.signupUser(
                              email, password, fullname, context)) {
                            Get.offNamed(routes.getDashboardRoute());
                          }
                        }
                      })
                ],
              )),
          15.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(have_acnt_txt),
              txtButton(
                  txt: login_txt,
                  txtColor: Colors.red,
                  fontSize: 13.0,
                  onTap: () {
                    Get.offNamed(routes.getLoginRoute());
                  }),
            ],
          ),
        ],
      ).marginOnly(left: 15, right: 15)),
    ));
  }
}
