import 'package:link_flutter/components/match_card.dart';
import 'package:link_flutter/components/match_title.dart';
import 'package:link_flutter/dummy_data/match_page_json.dart';
import 'package:link_flutter/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:link_flutter/theme/color.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../components/profile_view.dart';

// final List<String> imgList = [
//   'assets/images/img15.jpg',
//   'assets/images/img17.jpg',
//   'assets/images/img10.jpg',
// ];

final List<Widget> imageSliders = carousellItems
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      item["imageUrl"],
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '${item["name"]}, ${item["age"]}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class MatchPage extends StatelessWidget {
  const MatchPage({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Heart for you",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
            "Checkout who likes you!",
            style: TextStyle(fontSize: 16, height: 1.5),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileView(
                  userId: carousellItems[0]['userId'],
                ),
              ),
            );
          },
          child: CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
        ),
        // Wrap(
        //   children: carousellItems.map((item) {
        //   return GestureDetector(
        //     onTap: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => ProfileView(
        //             userId: item['userId'],
        //           ),
        //         ),
        //       );
        //     },
        //         child: CarouselSlider(
        //           items: imageSliders,
        //           options: CarouselOptions(
        //               height: 400, autoPlay: true, enlargeCenterPage: true),
        //         ),
        //   ),
        // ),

        MatchTitle(
          title: "Today",
        ),
        SizedBox(
          height: defaultMediumPadding,
        ),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: List.generate(todayMatchItems.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfileView(userId: todayMatchItems[index]['userId']),
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
        SizedBox(
          height: defaultPadding,
        ),
        MatchTitle(
          title: "Yesterday",
        ),
        SizedBox(
          height: defaultMediumPadding,
        ),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: List.generate(yesterdayMatchItems.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileView(
                        userId: yesterdayMatchItems[index]['userId']),
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
        SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}
