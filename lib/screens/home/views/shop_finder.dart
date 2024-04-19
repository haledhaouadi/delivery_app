import 'package:delivery/screens/home/views/ArticleListScreen.dart';
import 'package:delivery/screens/home/views/CardScreen.dart';
import 'package:delivery/screens/home/views/CustomDotsIndicator.dart';
import 'package:delivery/screens/auth/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// Import BlocBuilder

class ShopFinderInterface extends StatefulWidget {
  @override
  _ShopFinderInterfaceState createState() => _ShopFinderInterfaceState();
}

class _ShopFinderInterfaceState extends State<ShopFinderInterface> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your favourite Delivery APP !!'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person_add), // Sign-up/sign-in icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
                enlargeCenterPage: true,
                scrollDirection: Axis.vertical,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: [
                _buildCarouselItem('Find the Shop', 'assets/market.jpg', 0),
                _buildCarouselItem(
                    'Choose the Article', 'assets/article.jpg', 1),
                _buildCarouselItem(
                    'Choose Your Delivery Agency', 'assets/delivery.jpg', 2),
              ],
            ),
          ),
          CustomDotsIndicator(currentIndex: _currentIndex, itemCount: 3),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(String title, String imagePath, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(imagePath),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(158, 9, 15, 1.0),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'This is a small description about $title.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (index == 1) {
              // Assuming the "Choose the Article" item is at index 1
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArticleViewScreen(
                        // ignore: non_constant_identifier_names

                        )),
              );
            } else {
              // Handle other button presses or navigation
            } // Handle button press
          },
          child: Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(158, 9, 15, 1.0),
          ),
        ),
      ],
    );
  }
}
