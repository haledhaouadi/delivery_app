import 'package:flutter/material.dart';

class CustomDotsIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  CustomDotsIndicator({required this.currentIndex, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentIndex
                ? Color.fromRGBO(158, 9, 15, 1.0) // Active dot color
                : Colors.grey, // Inactive dot color
          ),
        );
      }),
    );
  }
}
