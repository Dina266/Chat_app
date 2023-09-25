
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../widgets/auth/auth_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late UserCredential credential;
  bool _isLoading = false ;


  void _submitAuthForm(String email, String password, String username,
      bool isLogin, BuildContext ctx , File? image) async {
        
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        final ref = FirebaseStorage.instance.ref().child('user_image').child('${credential.user!.uid}.jpeg');
        await ref.putFile(image!);

        final url = await ref.getDownloadURL();

        await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set({
      'username' : username,
      'password' : password,
      'imageUrl' : url,
    });
      }
    } on FirebaseAuthException catch (e) {
      String message = 'error Occurred';
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
        message = 'The account already exists for that email.';
      } else if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
        message = 'Wrong password provided for that user.';
      }
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(content: Text(message),
        backgroundColor: Theme.of(ctx).errorColor,
        ),
        );
        setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 129, 125, 125),
      body: AuthForm(_submitAuthForm , _isLoading),
    );
  }
}
