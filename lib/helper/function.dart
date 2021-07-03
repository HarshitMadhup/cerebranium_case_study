import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddDetails {
  static void addDetails(String name, String email, String account,
      String contact, String ifsc, BuildContext context) async {
    try {
      FirebaseFirestore.instance.collection('UserDetails').add({
        'CreatedAt': Timestamp.now(),
        'Name': name,
        'Email': email,
        'accountNumber': account,
        'IFSC': ifsc,
        'PhoneNumber': contact,
      }).then((value) {
        AwesomeDialog(
            context: context,
            animType: AnimType.LEFTSLIDE,
            headerAnimationLoop: false,
            dialogType: DialogType.SUCCES,
            btnOkText: 'OK',
            btnOkColor: Colors.cyan,
            showCloseIcon: true,
            title: 'Succes',
            desc: 'Details Uploaded',
            btnOkOnPress: () {
              debugPrint('OnClcik');
            },
            onDissmissCallback: (type) {
              debugPrint('Dialog Dissmiss from callback $type');
            })
          ..show();
        print("Uploaded");
      });
    } on Exception catch (error) {
      print(error.toString());
    }
  }
}
