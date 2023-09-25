import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({super.key});

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _controller = TextEditingController();
  String _enterMessage = "";

  _sendMessage() async{
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
    FirebaseFirestore.instance.collection('chat').add({
      'text': _enterMessage , 
      'createdAt' : Timestamp.now(),
      'userId' : user.uid,
      'username' :userData['username'],
      'userImage' :userData['imageUrl'],
      });
    _controller.clear();
    setState(() {
      _enterMessage ='';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(children: [
        Expanded(
          child: TextField(
            autocorrect: true,
            enableSuggestions: false,
            textCapitalization: TextCapitalization.sentences,
            controller: _controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor
                )
              ),
              hintText: 'Send message ...',
              
              hintStyle: TextStyle(color: Theme.of(context).primaryColor)

            ),
            style: TextStyle(color: Colors.black),
            onChanged: (value) {
              setState(() {
                _enterMessage = value;
              });
            }
          ),
        ),
        IconButton(
          color: Theme.of(context).primaryColor,
          icon: Icon(Icons.send ),
          onPressed: _enterMessage.trim().isEmpty ? null : _sendMessage,
          ),
      ]),
    );
  }
}
