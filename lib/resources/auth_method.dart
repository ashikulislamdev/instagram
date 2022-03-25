import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/resources/storage_method.dart';

class AuthMethod{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    Uint8List? file,
  }) async {
    String res = "Some error occurred";

    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty) {
        //register user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        print(credential.user!.uid);

        String photoUrl = await StorageMethod().uploadImageToStorage('usersProfile', file!, false);

        //add user to our database 
        await _firestore.collection('users').doc(credential.user!.uid).set({
          'username' : username,
          'uid' : credential.user!.uid,
          'email' : email,
          'bio' : bio,
          'followers' : [],
          'following' : [],
          'photoUrl' : photoUrl
        });

        //another way
        // await _firestore.collection('users').add({
        //   'username' : username,
        //   'uid' : credential.user!.uid,
        //   'email' : email,
        //   'bio' : bio,
        //   'followers' : [],
        //   'following' : [] 
        // });

        res = "Success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  } 
}
