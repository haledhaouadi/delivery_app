import 'package:flutter/material.dart';

class MainArticlePage extends StatefulWidget {
  const MainArticlePage({super.key});

  @override
  _MainArticlePageState createState() => _MainArticlePageState();
}

class _MainArticlePageState extends State<MainArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Choose your favourite",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Text("Delevery Agency",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(158, 9, 15, 1.0)))
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    child: Icon(Icons.home, color: Colors.white),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(158, 9, 15, 1.0)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
