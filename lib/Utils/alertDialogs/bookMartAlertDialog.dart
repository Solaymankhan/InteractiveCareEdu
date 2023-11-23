import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_edu/Utils/buttons/cornerRoundedButton.dart';
import 'package:interactive_cares_edu/Utils/constants/colors.dart';
import 'package:interactive_cares_edu/Utils/constants/strings.dart';
import 'package:interactive_cares_edu/Utils/functions/hexColor.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../LocalData/sharedPreferencesData.dart';

class bookMartAlertDialog extends StatelessWidget {
  bookMartAlertDialog({Key? key,required this.time}) : super(key: key);
  String time;
  sharedPreferencesData sharedpreferencesdata=new sharedPreferencesData();
  final GlobalKey<FormState> note_form_key=GlobalKey<FormState>();
  TextEditingController _descriptionTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: note_form_key,
      child: AlertDialog(
        title: Text('Add Bookmark',style: TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Time : "+time+" sec",
              style:
              TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ).objectCenterLeft(),
            5.heightBox,
            SizedBox(
              child: TextFormField(
                  controller: _descriptionTextController,
                  maxLines: 4,
                  minLines: 1,
                  maxLength: 500,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    contentPadding: EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder( // Add this block
                      borderRadius: BorderRadius.circular(2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide(
                        color: CupertinoColors.systemGrey4, // Set unfocused border color
                      ),
                    ),
                    border: OutlineInputBorder( // Add this block
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide(
                        width: 1,
                        color: CupertinoColors.systemGrey4, // Set unfocused border color
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Description Required";
                    }
                    return null;
                  }
              ),
            ),
          ],
        ),
        actions: [
          cornerRoundedButton(text: cancel_txt,height: 35.0, width: 70.0,
          bgColor: hexColor(interactive_color_1_hex),txtColor: Colors.white, onTap: () {
            Navigator.of(context).pop();
          }),
          cornerRoundedButton(text: add_txt, height: 35.0, width: 70.0,
              bgColor: hexColor(interactive_color_1_hex),txtColor: Colors.white,
              onTap: () {
                if(check_note_valid()){
                  Navigator.of(context).pop();
                  sharedpreferencesdata.saveBookmark(time,_descriptionTextController.text);
                }
              }),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }


  bool check_note_valid(){
    final isValid=note_form_key.currentState!.validate();
    if(!isValid) {
      return false;
    }
    else{
      note_form_key.currentState!.save();
      return true;
    }
  }
}