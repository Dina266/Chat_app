import 'package:chat_app/widgets/chats/message.dart';
import 'package:chat_app/widgets/chats/new_message.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((msg) {
      print(msg);
      return;
    });


    // final fbm = FirebaseMessaging.instance;

    // fbm.requestPermission(
    //   alert: true,
    //   badge: true,
    //   sound: true,
    // );

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   // Handle incoming messages when the app is in the foreground
    //   print('Received message: ${message.notification?.body}');
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   // Handle when the app is opened from a notification
    //   print('Opened app from notification: ${message.notification?.body}');
    // });

    // fbm.getToken().then((token) {
    //   // Handle token retrieval
    //   print('Token: $token');
    // });
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Chat'),
          actions: [
            DropdownButton(
              underline: Container(height: 0,),
              icon : Icon (Icons.more_vert , color: Theme.of(context).primaryIconTheme.color ,) ,
            items :[
              DropdownMenuItem(
                
                child: Row(
                children: [
                  Icon(Icons.exit_to_app , color: Colors.white,),
                  SizedBox(width: 8,),
                  Text('Logout' , style: TextStyle(color: Colors.black), )

              ],),value: 'logout',

              )
            ], 
            onChanged: (itemIdentifier){
              if(itemIdentifier == 'logout'){
                FirebaseAuth.instance.signOut();
              }
            })
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(child: Message()),
              NewMessages(),
            ],
          ),
        ),
        
            );
  }
}
