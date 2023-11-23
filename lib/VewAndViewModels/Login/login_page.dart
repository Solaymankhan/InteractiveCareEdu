import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_edu/Networks/services/firebaseEmailAuth.dart';
import 'package:interactive_cares_edu/Utils/constants/colors.dart';
import 'package:interactive_cares_edu/Utils/constants/image_paths.dart';
import 'package:interactive_cares_edu/Utils/functions/hexColor.dart';
import 'package:interactive_cares_edu/Utils/routes/routs.dart';
import 'package:interactive_cares_edu/Utils/widgets/textAlignment.dart';
import 'package:velocity_x/velocity_x.dart';

class login_page extends StatelessWidget {
  login_page({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullname = '';
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(height: 110, width: 110, image: AssetImage(logo_img))
              .box
              .roundedFull
              .make(),
          10.heightBox,
          Text(
            "Log In Now",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: hexColor(interactive_color_2_hex)),
          ),
          Text(
            "Please Login to continue Interactive Care Edu",
            style: TextStyle(fontSize: 13),
          ),
          30.heightBox,
          Form(
            key: _formKey,
              child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(fontSize: 13),
                  prefixIcon: Icon(
                    Icons.mail,
                    size: 20,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                 email = value!;
                },
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please Enter valid Email';
                  } else {
                    return null;
                  }
                },
              ),
              20.heightBox,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: Icon(Icons.lock, size: 20),
                ),
                onSaved: (value) {
                  password = value!;
                },
                validator: (value) {
                  if (value!.isEmpty || value.length<6 || value.length>10) {
                    return 'Please Enter valid password';
                  } else {
                    return null;
                  }
                },
              ),
              5.heightBox,
              Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(50),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(fontSize: 13, color: Vx.gray600),
                      ).paddingOnly(left: 5, right: 5),
                    ),
                  )),
              15.heightBox,
              InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    firebaseEmailAuth.signinUser(email, password, context);

                  }
                },
                borderRadius: BorderRadius.circular(50),
                child: Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: hexColor(interactive_color_1_hex)),
                  height: 35,
                  width: 120,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ).box.alignCenter.make(),
                ),
              ),
            ],
          )),
          15.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account ? "),
              InkWell(
                onTap: () {
                  Get.toNamed(routes.getSignUpRoute());
                },
                borderRadius: BorderRadius.circular(50),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ).paddingOnly(left: 5, right: 5),
                ),
              ),
            ],
          ),
        ],
      ).marginOnly(left: 15, right: 15),
    ));
  }
}
