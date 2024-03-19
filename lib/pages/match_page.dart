import 'package:link_flutter/components/box_svg_button.dart';
import 'package:link_flutter/components/match_card.dart';
import 'package:link_flutter/components/match_title.dart';
import 'package:link_flutter/dummy_data/match_page_json.dart';
import 'package:link_flutter/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:link_flutter/theme/color.dart';
import 'package:link_flutter/components/circle_button.dart';

import '../components/profile_view.dart';


class MatchPage extends StatelessWidget {
  const MatchPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: getAppBar(),
      body: getBody(size, context),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "People Who Liked You",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              BoxSvgButton(
                onTap: () {},
                svgPicture: "assets/images/sort.svg",
              ),
            ],
          ),
        ),
      ),
    ); 
  }

  Widget getBody(Size size, BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultMediumPadding),
          child: Text(
            "This is a list of people who have liked you.",
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ),
        MatchTitle(title: "Today",),
        SizedBox(height: defaultMediumPadding,),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: List.generate(todayMatchItems.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileView(userId: todayMatchItems[index]['userId']),
                  ),
                );
              },
              child: MatchCard(
                width: (size.width - 55) / 2,
                itemList: todayMatchItems[index],
              ),
            );
          }),
        ),
        SizedBox(height: defaultPadding,),
        MatchTitle(title: "Yesterday",),
        SizedBox(height: defaultMediumPadding,),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: List.generate(yesterdayMatchItems.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileView(userId: yesterdayMatchItems[index]['userId']),
                  ),
                );
              },
              child: MatchCard(
                width: (size.width - 55) / 2,
                itemList: yesterdayMatchItems[index],
              ),
            );
          }),
        ),

        SizedBox(height: defaultPadding,),
      ],
    );
  }

}