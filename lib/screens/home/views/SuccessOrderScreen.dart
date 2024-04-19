import 'package:delivery/screens/home/views/order_details.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SuccessOrderScreen extends StatefulWidget {
  @override
  _SuccessOrderScreenState createState() => _SuccessOrderScreenState();
}

class _SuccessOrderScreenState extends State<SuccessOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Article photo and slider
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 150, // Adjust the height as needed
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                  ),
                  items: [
                    Image.network('https://example.com/image1.jpg',
                        fit: BoxFit.cover),
                    Image.network('https://example.com/image2.jpg',
                        fit: BoxFit.cover),
                    Image.network('https://example.com/image3.jpg',
                        fit: BoxFit.cover),
                  ].map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors
                                .transparent, // Make the background transparent
                          ),
                          child: item,
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            // Article name, description, and price
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:
                    Colors.grey.withOpacity(0.5), // Semi-transparent background
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Article Name',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.8), // Darker font
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Article Description',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.8), // Darker font
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$99.99',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.8), // Darker font
                    ),
                  ),
                ],
              ),
            ),
            // Thank you message and buttons
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Icon(Icons.check,
                      size: 48,
                      color: Color.fromRGBO(158, 9, 15, 1.0)), // Tick icon
                  SizedBox(height: 16),
                  Text(
                    'Thank you for your order!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(158, 9, 15, 1.0),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderDetailsScreen()),
                      );
                    },
                    child: Text('Track Order'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromRGBO(158, 9, 15, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Order Something Else'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
