import 'package:flutter/material.dart';

class ArticleViewItem extends StatefulWidget {
  const ArticleViewItem({Key? key}) : super(key: key);

  @override
  State<ArticleViewItem> createState() => _ArticleViewItemState();
}

class _ArticleViewItemState extends State<ArticleViewItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.blueGrey, // Adjust the color as needed
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 86),
          Container(
            padding: EdgeInsets.only(right: 2, bottom: 5),
            child: FloatingActionButton(
              onPressed: () => print("See Agent Details"),
              child: Icon(Icons.add),
              backgroundColor:
                  Colors.blue, // Customize the background color as needed
            ),
          ),
        ],
      ),
    );
  }
}
