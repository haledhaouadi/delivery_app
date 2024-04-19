import 'dart:convert';
import 'package:delivery/main.dart';
import 'package:delivery/models/Agency.dart';
import 'package:delivery/screens/home/views/AgencyForm.dart';
import 'package:delivery/screens/home/views/SuccessOrderScreen.dart';
import 'package:delivery/screens/home/views/shop_finder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Agency> agencies = [];
  List<Agency> filteredAgencies = [];

  @override
  void initState() {
    super.initState();
    _fetchAgencies();
    _searchController.addListener(_filterAgencies);
  }

  Future<void> _fetchAgencies() async {
    try {
      var url = Uri.parse('http://localhost:8080/get-all-adresses');
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          agencies = (jsonDecode(response.body) as List)
              .map((data) => Agency.fromJson(data))
              .toList();
          filteredAgencies =
              agencies; // Initialize filteredAgencies with all agencies
        });
      } else {
        throw Exception('Failed to load agencies');
      }
    } catch (e) {
      print('Error fetching agencies: $e');
    }
  }

  void _filterAgencies() {
    String searchText = _searchController.text.toLowerCase();
    setState(() {
      filteredAgencies = agencies.where((agency) {
        return agency.name.toLowerCase().contains(searchText) ||
            agency.adresse.toLowerCase().contains(searchText) ||
            agency.description.toLowerCase().contains(searchText);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose your favorite",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Text(
              "Delivery Agency",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(158, 9, 15, 1.0),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              width: 45,
              height: 45,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShopFinderInterface(),
                    ),
                  ); // Action for the IconButton
                },
                icon: const Icon(Icons.home, color: Colors.white),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(158, 9, 15, 1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              width: 45,
              height: 45,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AgencyForm()),
                  );
                },
                icon: Icon(Icons.admin_panel_settings, color: Colors.white),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(158, 9, 15, 1.0),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredAgencies.length,
              itemBuilder: (context, index) {
                final agency = filteredAgencies[index];
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(agency.name),
                      subtitle:
                          Text('${agency.description}\n${agency.adresse}'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          _showNotification();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SuccessOrderScreen(),
                            ),
                          ); // Action when the choose button is pressed
                        },
                        child: Text('Choose'),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _showNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails('your channel id', 'your channel name',
          importance: Importance.max, priority: Priority.high, showWhen: false);
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(0, 'Delivery Agency Selected',
      'You have chosen your delivery agency.', platformChannelSpecifics,
      payload: 'item x');
}
