import 'package:flutter/material.dart';
import 'package:link_flutter/dummy_data/home_page_json.dart'; // Ensure this import points to your actual data
import 'package:link_flutter/components/circle_button.dart';
import 'package:link_flutter/theme/color.dart';
import 'package:link_flutter/utils/constant.dart';
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
    items = discoverItems;
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
    // Convert the Set to a List for easier indexing.
    List<String> instagramImages = profile['instagram'].toList();

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildProfileImage(profile['imageUrl']),
        _buildProfileInfo(profile),
        _buildInstagramImages(instagramImages),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildProfileImage(String imageUrl) {
    return Container(
      height: MediaQuery.of(context).size.height *
          0.6, // Adjust the height as necessary.
      width: double.infinity,
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }

  Widget _buildProfileInfo(Map<String, dynamic> profile) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${profile['name']}, ${profile['age']}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(profile['passion']),
          SizedBox(height: 4.0),
          Text(profile['distance']),
        ],
      ),
    );
  }

  Widget _buildInstagramImages(List<String> instagramImages) {
    return Container(
      height: 100, // Fixed height for the horizontal list.
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
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCircleButton(
              "assets/images/cross.svg", () => _goToNextProfile()),
          _buildCircleButton("assets/images/link.svg", () => _goToNextProfile(),
              isLarge: true),
          _buildCircleButton(
              "assets/images/like.svg", () => _goToNextProfile()),
        ],
      ),
    );
  }

  Widget _buildCircleButton(String svgPath, VoidCallback onTap,
      {bool isLarge = false}) {
    return CircleButton(
      onTap: onTap,
      bgColor: Color(0xFFCB9CFC),
      shadowColor: black.withOpacity(0.2),
      svgPicture: svgPath,
      svgHeight: isLarge ? 60 : 24,
      svgWidth: isLarge ? 60 : 24,
      height: isLarge ? 99 : 60,
      width: isLarge ? 99 : 60,
    );
  }

  void _goToNextProfile() {
    if (_pageController.page != null &&
        _pageController.page! < items.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    } else {}
  }
}
