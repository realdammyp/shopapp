import 'package:flutter/material.dart';
import 'package:shopapp/components/text_field_container.dart';
import 'package:shopapp/screens/constants.dart';
import 'package:shopapp/controllers/authController.dart';
import 'package:get/get.dart';


class RoundedInputField extends GetWidget<AuthController> {
    //final AuthController authController = Get.find();

  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

   RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        //controller: authController.newemailController.value,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
     
    );
  }
}
