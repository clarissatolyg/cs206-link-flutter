
import 'package:link_flutter/theme/color.dart';
import 'package:link_flutter/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MatchCard extends StatelessWidget {
  final double? height, width;
  final itemList;
  
  const MatchCard({
    Key? key, 
    this.height = 240, 
    this.width, 
    this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            image: DecorationImage(
              image: NetworkImage(itemList['imageUrl']),
              fit: BoxFit.cover
            )
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultMediumPadding),
                child: Text(
                  "${itemList['name']}, ${itemList['age']}",
                  style: TextStyle(
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

            ],
          )
        ),
      ],
    );
  }
}
