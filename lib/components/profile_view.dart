import 'package:flutter/material.dart';
import 'package:link_flutter/dummy_data/match_page_json.dart';
import 'package:flutter/material.dart';
import 'package:link_flutter/components/circle_button.dart';
import 'package:link_flutter/theme/color.dart';
import 'package:link_flutter/utils/constant.dart';
import 'package:link_flutter/components/box_svg_button.dart';

class ProfileView extends StatelessWidget {
  final String userId;

  const ProfileView({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List matchItems = todayMatchItems + yesterdayMatchItems;
    final Map<String, dynamic> profile = matchItems.firstWhere(
          (item) => item['userId'] == userId,
      orElse: () => {},
    );

    List<String> instagramImages = profile['instagram'].toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildProfileImage(profile['imageUrl'], context),
            _buildProfileInfo(profile),
            Text("Instagram",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            _buildInstagramImages(instagramImages),
            _buildActionButtons(),
          ]
      )
    );
  }

  Widget _buildProfileImage(String imageUrl, BuildContext context) {
    return SizedBox(
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
          Text(profile['passion'],
              style: TextStyle(fontSize: 16)),
          SizedBox(height: 8.0),
          Text("Interests",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _buildInterests(profile),
          SizedBox(height: 8.0),
          Text("Music Genre",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _buildMusicGenre(profile),
          SizedBox(height: 4.0),
          Text(profile['quote'], style: TextStyle(fontSize: 12)),
          SizedBox(height: 4.0),
        ],
      ),
    );
  }

  Widget _buildInterests(Map<String, dynamic> profile) {
    List<String> interests = profile['interests'].split(', ');

    return SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: interests.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Chip(
                label: Text(interests[index]),
                backgroundColor: Colors.white,
                elevation: 1.0,
                shadowColor: black,
                side: BorderSide.none,
              ),
            );
          },
        ));
  }

  Widget _buildMusicGenre(Map<String, dynamic> profile) {
    List<String> genres = profile['musicGenre'].split(', ');
    return SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Chip(
                    label: Text(genres[index]),
                    backgroundColor: Colors.white,
                    elevation: 1.0,
                    shadowColor: black,
                    side: BorderSide.none));
          },
        ));
  }

  Widget _buildInstagramImages(List<String> instagramImages) {
    return SizedBox(
      height: 100, // Fixed height for the horizontal list.
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: instagramImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(instagramImages[index], fit: BoxFit.cover),
            ),
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
              "assets/images/cross.svg", () => {}),
          _buildCircleButton("assets/images/link.svg", () => {},
              isLarge: true),
          _buildCircleButton(
              "assets/images/like.svg", () => {}),
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

// Include _buildProfileInfo, _buildInstagramImages, etc.
}
