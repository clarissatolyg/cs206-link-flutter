import 'package:link_flutter/theme/color.dart';
import 'package:link_flutter/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageListTitle extends StatelessWidget {
  final itemList;
  final VoidCallback onPressed;

  const MessageListTitle({
    Key? key,
    this.itemList,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultSmallPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: (size.width - 40) * 0.15,
              width: (size.width - 40) * 0.15,
              padding: EdgeInsets.all(defaultPadding / 10),
              decoration: itemList["isUnread"]
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: bgStoryColors),
                    )
                  : null, // No decoration when isUnread is false,
              child: Container(
                decoration: BoxDecoration(
                    color: white,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: white),
                    image: DecorationImage(
                        image: NetworkImage(itemList["imageUrl"]),
                        fit: BoxFit.cover)),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: (size.width - 40) * 0.15,
                      width: (size.width - 40) * 0.7,
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultMediumPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            itemList["username"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            itemList["message"].last["text"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: (size.width - 40) * 0.15,
                      width: (size.width - 40) * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            timeago.format(itemList["message"].last["dateTime"],
                                locale: 'en_short'),
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          itemList['isUnread']
                              ? Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: primary, shape: BoxShape.circle),
                                  child: Text(
                                    itemList['unread'],
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: defaultSmallPadding,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: defaultMediumPadding),
                  child: Container(
                    height: 1,
                    width: (size.width - 60) * 0.85,
                    color: bgBorder,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
