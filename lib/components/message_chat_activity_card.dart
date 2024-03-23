import 'package:flutter/material.dart';
import 'package:link_flutter/utils/constant.dart';
import 'package:link_flutter/theme/color.dart';

class MessageChatActivityCard extends StatelessWidget {
  final itemList;
  
  const MessageChatActivityCard({
    Key? key, 
    this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 41,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding / 10),
            child: Container(
              height: 41,
              decoration: BoxDecoration(
                color: white,
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: white),
                image: DecorationImage(
                  image: NetworkImage(itemList["imageUrl"]),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
          Text(
            itemList["username"],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
