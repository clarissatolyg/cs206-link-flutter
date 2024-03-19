import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:link_flutter/dummy_data/home_page_json.dart'; // Ensure this import points to your actual data
import 'package:link_flutter/components/circle_button.dart';
import 'package:link_flutter/theme/color.dart';
import 'package:link_flutter/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:link_flutter/components/box_svg_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  List items = [];

  @override
  void initState() {
    super.initState();
    items = discoverItems; // Assuming this is your data source
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: PageView.builder(
        controller: _pageController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildProfilePage(items[index]);
        },
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            children: [
              Spacer(),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Text(
                      "Discover",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Phnom Penh",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: BoxSvgButton(
                onTap: () {},
                svgPicture: "assets/images/filter.svg",
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePage(Map<String, dynamic> profile) {
    // Convert the Set to a List for easier indexing
    List<String> instagramImages = profile['instagram'].toList();

    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 150,
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  profile['imageUrl'],
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft, // Align to the left
                child: Column(children: [
                  Text(
                    "${profile['name']}, ${profile['age']}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ],
          ),
        ),
        Container(
          height: 100, // Fixed height for the horizontal list
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: instagramImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Image.asset(instagramImages[index], fit: BoxFit.cover),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleButton(
              onTap: () {
                _goToNextProfile();
              },
              bgColor: white,
              shadowColor: black.withOpacity(0.2),
              svgPicture: "assets/images/dislike.svg",
            ),
            CircleButton(
              onTap: () {
                _goToNextProfile();
              },
              height: 99,
              width: 99,
              bgColor: primary,
              shadowColor: primary.withOpacity(0.3),
              svgPicture: "assets/images/like.svg",
            ),
            CircleButton(
              onTap: () {
                _goToNextProfile();
              },
              bgColor: white,
              shadowColor: black.withOpacity(0.2),
              svgPicture: "assets/images/super_like.svg",
            ),
          ],
        ),
      ],
    );
  }

  void _goToNextProfile() {
    if (_pageController.page != null &&
        _pageController.page! < items.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    } else {
      // Optionally, handle the case when the user is at the last profile (e.g., show a dialog or loop back to the first profile).
      // For example, to loop back to the first profile:
      // _pageController.jumpToPage(0);
    }
  }
}















// import 'package:link_flutter/components/box_svg_button.dart';
// import 'package:link_flutter/components/circle_button.dart';
// import 'package:link_flutter/components/discover_card.dart';
// import 'package:link_flutter/dummy_data/home_page_json.dart';
// import 'package:link_flutter/theme/color.dart';
// import 'package:link_flutter/utils/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_swipecards/flutter_swipecards.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({ Key? key }) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   CardController controller = CardController();

//   List items = [];
//   int itemLength = 0;

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       items = discoverItems;
//       itemLength = discoverItems.length;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: getAppBar(),
//       body: getBody(size),
//     );
//   }

//   AppBar getAppBar() {
//     return AppBar(
//       flexibleSpace: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//           child: Row(
//             children: [
//               Spacer(),
//               Expanded(
//                 flex: 5,
//                 child: Column(
//                   children: [
//                     Text(
//                       "Discover",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold
//                       ),
//                     ),
//                     Text("Phnom Penh", style: TextStyle(fontSize: 12),)
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: BoxSvgButton(
//                   onTap: () {},
//                   svgPicture: "assets/images/filter.svg",
//                 )
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget getBody(Size size) {
//     return Column(
//       children: [
//         Expanded(
//           flex: 4,
//           child: TinderSwapCard(
//             cardController: controller,
//             maxHeight: size.height * 0.75,
//             maxWidth: size.width,
//             minHeight: size.height * 0.5,
//             minWidth: size.width * 0.8,
//             orientation: AmassOrientation.top,
//             swipeUp: true,
//             swipeDown: true,
//             stackNum: 2,
//             totalNum: itemLength,
//             cardBuilder: (context, index) {
//               return DiscoverCard(
//                 itemList: items[index], 
//               );
//             },
//             swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
//               if(index == (items.length - 1)) {
//                 setState(() {
//                   itemLength = items.length - 1;
//                 });
//               }
//             },
//           ) 
//         ),
//         Expanded(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               CircleButton(
//                 onTap: () {},
//                 bgColor: white,
//                 shadowColor: black.withOpacity(0.2),
//                 svgPicture: "assets/images/dislike.svg",
//               ),
//               CircleButton(
//                 onTap: () {},
//                 height: 99,
//                 width: 99,
//                 bgColor: primary,
//                 shadowColor: primary.withOpacity(0.3),
//                 svgPicture: "assets/images/like.svg",
//               ),
//               CircleButton(
//                 onTap: () {},
//                 bgColor: white,
//                 shadowColor: black.withOpacity(0.2),
//                 svgPicture: "assets/images/super_like.svg",
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
