import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:interactive_cares_edu/Utils/buttons/colorButton.dart';
import 'package:interactive_cares_edu/Utils/buttons/txtButton.dart';
import 'package:interactive_cares_edu/Utils/constants/strings.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_edu/Networks/services/firebaseEmailAuth.dart';
import 'package:interactive_cares_edu/Utils/constants/colors.dart';
import 'package:interactive_cares_edu/Utils/constants/image_paths.dart';
import 'package:interactive_cares_edu/Utils/functions/hexColor.dart';
import 'package:interactive_cares_edu/Utils/routes/routs.dart';
import 'package:interactive_cares_edu/Utils/widgets/logo_image.dart';
import 'package:interactive_cares_edu/Utils/widgets/textField.dart';
import 'package:velocity_x/velocity_x.dart';

class login_page extends StatelessWidget {
  login_page({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.sizeOf(context).height;
    double w=MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          100.heightBox,
          logo_image(img: logo_img),
          10.heightBox,
          Text(
            lgin_nw_txt,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: hexColor(interactive_color_2_hex)),
          ),
          Text(
            please_lgin_txt,
            style: TextStyle(fontSize: 13),
          ),
          30.heightBox,
          Form(
              key: _formKey,
              child: Column(
                children: [
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
                  5.heightBox,
                  Align(
                      alignment: Alignment.centerRight,
                      child: txtButton(
                          txt: forgot_pass_txt,
                          txtColor: Vx.gray600,
                          fontSize: 13.0,
                          onTap: () {})),
                  20.heightBox,
                  colorButton(
                      txt: login_txt,
                      height: 35.0,
                      width: 200.0,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          if (await firebaseEmailAuth.signinUser(
                              email, password, context)) {
                            Get.offNamed(routes.getDashboardRoute());
                          }
                        }
                      }),
                ],
              ).constrainedBox(BoxConstraints(
                maxWidth: 500, // Set your maximum width here
              ))),
          20.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(dnt_hv_acnt_txt),
              txtButton(
                  txt: signup_txt,
                  txtColor: Colors.red,
                  fontSize: 13.0,
                  onTap: () {
                    Get.toNamed(routes.getSignUpRoute());
                  }),
            ],
          ),
          100.heightBox
        ],
      ).marginOnly(left: 15, right: 15)),
    ));
  }
}
