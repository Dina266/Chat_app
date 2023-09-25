import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {


  const MessageBubble(this.message, this.userName,this.userImage, this.isMe, {this.key});

  final String userImage;
  final Key? key;
  final String message ;
  final bool isMe;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
        mainAxisAlignment: !isMe? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: !isMe ? Colors.grey[300] : Theme.of(context).hintColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
                bottomLeft: isMe ? Radius.circular(0) : Radius.circular(14),
                bottomRight: !isMe ? Radius.circular(0) : Radius.circular(14),
              )
            ),
            width: 140,
            padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 16),
            margin: EdgeInsets.symmetric(vertical: 16 , horizontal: 8),
            child: Column(
              crossAxisAlignment: !isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
              Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: !isMe ? Colors.black : Colors.white
                ),
              ),
              Text(
                message,
                style: TextStyle(
                  color: !isMe? Colors.black : Colors.white
                ),
              textAlign: !isMe ? TextAlign.end : TextAlign.start,
              ),
            ]),
          )
    
        ],
      ),
      Positioned(
        top: -10,
        left: isMe ? 120 : null,
        right: !isMe ? 120 : null,
        child: CircleAvatar(
          backgroundImage: NetworkImage(userImage),
        ),
      )
      ],
      clipBehavior: Clip.none,
    );
  }
}