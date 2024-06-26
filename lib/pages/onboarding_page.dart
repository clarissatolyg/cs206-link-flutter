import 'package:flutter/material.dart';
import 'package:link_flutter/components/box_button.dart';
import 'package:link_flutter/components/onboarding_slide.dart';
import 'package:link_flutter/pages/dashboard_page.dart';
import 'package:link_flutter/theme/color.dart';
import 'package:link_flutter/utils/constant.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OnBoardingSlide(),
          SizedBox(height: defaultPadding * 2),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(primary),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                  child: Column(
                    children: [
                      BoxButton(
                        onTap: () {
                          // Set isLoading to true when the button is tapped
                          setState(() {
                            _isLoading = true;
                          });
                          // Simulate asynchronous operation (e.g., API call)
                          Future.delayed(Duration(seconds: 2), () {
                            // Navigate to DashboardPage after loading
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => DashboardPage()),
                              (route) => false,
                            );
                          });
                        },
                        text: "Create an account",
                      ),
                      SizedBox(height: defaultPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          SizedBox(width: defaultSmallPadding),
                          Text(
                            "Sign In",
                            style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
