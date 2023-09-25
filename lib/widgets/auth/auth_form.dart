import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../picker/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.submitFn ,this.isLoading , {super.key} );
  final bool isLoading;
  final Function(String email, String password, String username,  bool isLogin, BuildContext ctx,File? image,) submitFn;


  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  String _email = '';
  String _passward = '';
  String _userName = '';
  File? _userImageFile;

  void pickedImage (File? pickedImage) {
      _userImageFile = pickedImage!;
  }

  void _submit () {
    final isvalid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    

    if(_userImageFile == null && _isLogin == 'Sign Up') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('please select photo'),
      backgroundColor: Theme.of(context).errorColor,));
      return ;
    }

    if (isvalid){
      _formKey.currentState!.save();
      print(_email);
      print(_passward);
      print(_userName);
      widget.submitFn(
        _email.trim(),
        _passward.trim(),
        _userName.trim(),
        _isLogin,
        context,
        _userImageFile,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center (
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!_isLogin) UserImagePicker(pickedImage),
                TextFormField(
                  autocorrect: false,
                  enableSuggestions: false,
                  textCapitalization: TextCapitalization.none,
                  key: const ValueKey('email'),
                  validator: (val ){
                    if (val!.isEmpty || !val.contains('@')) {
                      return 'Please enter a valid email address ';
                    }
                    return null ;
                  },
                  onSaved: (val) => _email = val! ,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email Address'),
                ),
                if (!_isLogin)
                  TextFormField(
                    autocorrect: true,
                  enableSuggestions: false,
                  textCapitalization: TextCapitalization.words,
                    key: const ValueKey('username'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 4) {
                        return 'Please enter at least 4 characters';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _userName = newValue!,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                TextFormField(
                  key: const ValueKey('passward'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 7) {
                      return 'Passward must be at least 7 characters';
                    }
                    return null ;
                  },
                  onSaved: (newValue) => _passward = newValue!,
                  decoration: const InputDecoration(labelText: 'Passward'),
                  obscureText: true,
                ),
                const SizedBox(height: 12,),
                if(widget.isLoading) 
                  const CircularProgressIndicator(),
                if(!widget.isLoading) 
                  ElevatedButton(onPressed: _submit,
                  child: Text(_isLogin ? 'Login' : 'Sign Up')),
                if(!widget.isLoading) 
                  TextButton(onPressed: (){
                    setState(() {
                      _isLogin = ! _isLogin;
                    });
                  }, 
                  child: Text(_isLogin ? 'Create new account' : 'I already have an account'))
              ],
            ) 
          ),
        ),
      ),
      );
  }
}