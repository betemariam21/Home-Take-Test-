
import 'package:flutter/material.dart';

class Validator {
  static String validateEmail(String email, BuildContext context){
    if (email.trim().isEmpty) {
      return '';
    }
    if (!email.contains("@")) {
      return 'Email should contain @ symbol';
    }
    if (!email.contains(".")) {
      return 'Email should contain dot in its format';
    }

    return '';
  }
  static String validatePassword(String value,BuildContext context, {bool isOtp = false}){
    if(isOtp){
      if (value.trim().isEmpty) {
        return 'Enter OTP';
      }
      if(value.length < 4){
        return 'OTP is Four Letters';
      }
    }
    else{
      if (value.trim().isEmpty) {
        return 'Enter Password';
      }
      if(value.length < 6){
        return 'Password must be more than 6 characters';
      }
      if(value.contains(" ")){
        return 'No Space in Character is Allowed';
      }
    }

    return '';

  }
  static String validateName(String name, BuildContext context){
    if (name.trim().isEmpty) {
      return 'Please enter your name here';
    }
    return '';
  }
  static String validatePhone(String value,BuildContext context){
    if(!value.startsWith('966')){
      return 'Phone number must start with 966';
    }
    if(int.tryParse(value) == null){
      return 'Only number';
    }
    if(value.length != 10){
      return 'Phone number should be 10 digits';
    }
    return '';
  }
  static String validateConfirmationPassword(String newPassword,String confirmNewPassword, BuildContext context){
    if(newPassword != confirmNewPassword){
      return 'Password must be the same")';
    }
    return '';
  }

}