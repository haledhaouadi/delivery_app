// lib/screens/home/views/CardScreen.dart
// import 'package:delivery/screens/home/views/ArticleCard.dart';
// import 'package:flutter/material.dart';
// import 'package:delivery/models/Article.dart';
// import 'package:delivery/screens/home/views/ArticleListScreen.dart';

// class CardScreen extends StatefulWidget {
//   @override
//   _CardScreenState createState() => _CardScreenState();
// }

// class _CardScreenState extends State<CardScreen> {
//   List<Article> selectedArticles = [];

//   void _addArticle(Article article) {
//     setState(() {
//       selectedArticles.add(article);
//     });
//   }

//   void _removeArticle(Article article) {
//     setState(() {
//       selectedArticles.remove(article);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Card Client Interface')),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: selectedArticles.length,
//               itemBuilder: (context, index) {
//                 return ArticleCard(
//                   article: selectedArticles[index],
//                   onDelete: () => _removeArticle(selectedArticles[index]),
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>
//                         ArticleViewScreen(onSelect: _addArticle)),
//               );
//             },
//             child: Text('Select an Article'),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ArticleViewScreen(onSelect: _addArticle),
//             ),
//           );
//         },
//         child: Icon(Icons.add),
//         backgroundColor:
//             Colors.blue, // Customize the background color as needed
//       ),
//     );
//   }
// }
