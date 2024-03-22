import 'package:flutter/material.dart';
import 'package:link_flutter/utils/constant.dart';
import 'package:link_flutter/theme/color.dart';

class MessageActivityCard extends StatelessWidget {
  final itemList;
  final VoidCallback onPressed;

  const MessageActivityCard({
    Key? key,
    this.itemList,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding / 10),
            decoration: itemList["isUnread"]
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: bgStoryColors),
                  )
                : null, // No decoration when isUnread is false
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: white,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: white),
                  image: DecorationImage(
                      image: NetworkImage(itemList["imageUrl"]),
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            height: defaultSmallPadding,
          ),
          Text(
            itemList["username"],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
