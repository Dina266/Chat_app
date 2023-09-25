
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File? pickedImage) imagePickFn ;
  UserImagePicker(this.imagePickFn);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {

  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  void _pickImage(ImageSource src) async {
    final pickedImageFile = await _picker.pickImage(source: src ,
    imageQuality: 50 , maxWidth: 150);

    if (pickedImageFile != null ) {
      setState(() {
        _pickedImage = File (pickedImageFile.path);
      });
      widget.imagePickFn(_pickedImage);
    }else {
      print('no image selected');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _pickedImage != null ? FileImage(_pickedImage!) : null,

        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              icon: Icon(Icons.photo_camera_outlined),
              label: Text('Add Image\nfrom Camera' , textAlign: TextAlign.center,),
              style: ButtonStyle(textStyle: MaterialStatePropertyAll(TextStyle(
                  color: Theme.of(context).primaryColor
              ))),
              onPressed: () => _pickImage(ImageSource.camera),
              
              ),
            TextButton.icon(
              icon: Icon(Icons.image_outlined),
              label: Text('Add Image\nfrom Gallery' , textAlign: TextAlign.center,),
              style: ButtonStyle(textStyle: MaterialStatePropertyAll(TextStyle(
                  color: Theme.of(context).primaryColor
              ))),
              onPressed: () => _pickImage(ImageSource.gallery),
              
              ),
          ],
        ),
      ],
    );
  }
}