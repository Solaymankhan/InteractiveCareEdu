import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_edu/Utils/constants/colors.dart';
import 'package:interactive_cares_edu/Utils/constants/image_paths.dart';
import 'package:interactive_cares_edu/Utils/functions/hexColor.dart';
import 'package:interactive_cares_edu/Utils/routes/routs.dart';
import 'package:velocity_x/velocity_x.dart';

class signup_page extends StatelessWidget {
  const signup_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(height: 110,width: 110,image: AssetImage(logo_img)).box.roundedFull.make(),
              10.heightBox,
              Text(
                "Sign Up Now",
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),
              ),

              Text(
                "Please Fill the details and create account",
                style: TextStyle(fontSize: 13),
              ),
              30.heightBox,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: "Full Name",
                  labelStyle: TextStyle(fontSize: 13),
                  prefixIcon: Icon(Icons.person,size: 20,),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {},
                validator: (value) {},
              ).box.height(43).make(),
              20.heightBox,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(fontSize: 13),
                  prefixIcon: Icon(Icons.mail,size: 20,),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {},
                validator: (value) {},
              ).box.height(43).make(),
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
                onSaved: (value) {},
                validator: (value) {},
              ).box.height(43).make(),
              15.heightBox,
              InkWell(
                onTap: () {
                  Get.toNamed(routes.getDashboardRoute());
                },
                borderRadius: BorderRadius.circular(50),
                child: Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), color: hexColor(interactive_color_1_hex)),
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
              15.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ? "),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Log In",
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
