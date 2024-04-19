// lib/screens/home/views/ArticleListScreen.dart
// lib/screens/home/views/ArticleListScreen.dart
// import 'package:flutter/material.dart';
// import 'package:delivery/models/Article.dart';
// import 'package:delivery/screens/home/views/CardScreen.dart';

// class ArticleListScreen extends StatelessWidget {
//   final Function(Article) onSelect;

//   ArticleListScreen({required this.onSelect});

//   final List<Article> articles = [
//     Article(title: 'Article 1', description: 'Description 1'),
//     Article(title: 'Article 2', description: 'Description 2'),
//     // Add more articles as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Select an Article')),
//       body: ListView.builder(
//         itemCount: articles.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(articles[index].title),
//             subtitle: Text(articles[index].description),
//             trailing: ElevatedButton(
//               onPressed: () {
//                 onSelect(articles[index]);
//                 Navigator.pop(context); // Close the ArticleListScreen
//               },
//               child: Text('Add'),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:delivery/screens/home/views/ArticlesViews.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ArticleViewScreen extends StatefulWidget {
 const ArticleViewScreen({Key? key}) : super(key: key);

 @override
 State<ArticleViewScreen> createState() => _ArticleViewScreenState();
}

class _ArticleViewScreenState extends State<ArticleViewScreen> {
 @override
 Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildAppBar(context),
                SizedBox(height: 35),
                _buildDeliveryView(context),
              ],
            ),
          ),
        ),
      ),
    );
 }

 Widget _buildAppBar(BuildContext context) {
    return SizedBox(
      height: 161,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(bottom: 44),
              padding: EdgeInsets.symmetric(horizontal: 17),
              decoration: BoxDecoration(
                image: DecorationImage(
                 image: AssetImage('assets/images/ellipse_large.png'),
                 fit: BoxFit.none,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Padding(
                    padding: EdgeInsets.only(top: 13, bottom: 64),
                    child: IconButton(
                      icon: Image.asset('assets/images/home_icon.png', height: 40, width: 40),
                      onPressed: () {
                        print("Home button pressed");
                      },
                    ),
                 ),
                 Container(
                    height: 90,
                    width: 120,
                    margin: EdgeInsets.only(bottom: 34),
                    alignment: Alignment.topCenter,
                    child: IconButton(
                      icon: Image.asset('assets/images/basket_icon.png', height: 90, width: 120),
                      onPressed: () => print("Your cart"),
                    ),
                 ),
                 Padding(
                    padding: EdgeInsets.only(top: 13, bottom: 64),
                    child: IconButton(
                      icon: Image.asset('assets/images/user_icon.png', height: 40, width: 40),
                      onPressed: () => print("Your User Account"),
                    ),
                 ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 22, bottom: 41),
              child: Text(
                "First Delivery",
                style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
                 color: Colors.black,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 75,
              width: 75,
              margin: EdgeInsets.only(right: 61, bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(37),
                boxShadow: [
                 BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 4),
                 ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 126,
              margin: EdgeInsets.only(left: 57),
              child: Text(
                "Slogan : Lorem ipsum Dolor sit amet",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                 fontSize: 14,
                 color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
 }

 Widget _buildDeliveryView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 37, right: 33),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 122,
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, index) {
          return ArticleViewItem(
            // Assuming ArticleViewItem is a widget you've defined elsewhere
            // You can specify styles directly here or in the ArticleViewItem widget
          );
        },
      ),
    );
 }
}

