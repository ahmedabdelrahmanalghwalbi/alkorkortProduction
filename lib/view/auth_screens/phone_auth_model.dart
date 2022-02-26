import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korkort/view/home_screen/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:korkort/models/user.dart';

class PhoneLogin extends GetxController{
  var authState=''.obs;
  var isLoading = false.obs;
  String verificationID='';
  var auth = FirebaseAuth.instance;

  verifyPhone(String phone)async{
    await auth.verifyPhoneNumber(phoneNumber: phone,
        timeout: Duration(seconds: 40),
        verificationCompleted:(AuthCredential authCredential){},
        verificationFailed: (authException){
          Get.snackbar("error", "problem when send the code");
        },
        codeSent: (String id,[int forceResent]){
          this.verificationID=id;
          isLoading.value = false;
          authState.value="login success";
        },
        codeAutoRetrievalTimeout: (id){
          this.verificationID=id;
        }
    );
  }
  
  verifyOTP(String otp,bool isArabic)async{
    var credential=await auth.signInWithCredential(
      PhoneAuthProvider.credential(verificationId: this.verificationID, smsCode: otp),
    );
  if (credential != null){
//      Users user=new Users(email: email,password: password,firstName: firstName,lastName: lastName,uid: userCredential.user.uid);
//      FirebaseFirestore.instance.collection('users').add(user.toJson()).then((value) =>print("new user added successfully in the Firestore") ).catchError((error)=>print("error in store new user in the Firestore ${error}"));
      Get.offAll(HomeScreen(isArabic:isArabic));
    }
  }
}