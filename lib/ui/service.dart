import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:qwiva_waitlist/helpers/helpers.dart';

class FireStoreService {
  static final docWaitList =
      FirebaseFirestore.instance.collection('waitlist').doc('waitlist');

  static void addToWaitList(
      {required String name,
      required String email,
      required BuildContext context}) async {
    final body = {'name': name, 'email': email, 'date': DateTime.now()};

    showLoaderDialog(context);

    var waiters = await docWaitList.get();

    docWaitList.update({
      'waiters': [
        ...((waiters.data() as Map).containsKey("waiters")
            ? waiters["waiters"] as List
            : []),
        body
      ]
    }).whenComplete(() {
      Navigator.pop(context);
      showSuccessDialog(context);
    });
  }
}
