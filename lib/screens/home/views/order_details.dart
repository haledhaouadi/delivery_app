import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool showTrackingHistory = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 10), // Add some margin for spacing
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF9E090F),

                // Change the background color here
              ),
              child: SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () {
                    // Action to navigate to the home page
                  },
                  icon: Icon(Icons.home,
                      color: Colors.white,
                      size: 23), // Ensure icon color is white
                ),
              )),
        ],
      ),
      body: ListView(
        children: [
          // Map to track delivery agent
          Container(
            height: 200, // Set the height of the map
            color: Colors.grey, // Placeholder color for the map
            // You can replace this with your map widget
          ),
          SizedBox(height: 16), // Add some spacing
          // More details button
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showTrackingHistory = !showTrackingHistory;
                });
              },
              child: Text(showTrackingHistory
                  ? 'Hide Tracking History'
                  : 'More Details'),
            ),
          ),
          Visibility(
            visible: showTrackingHistory,
            child: _TrackingHistorySection(),
          ),
        ],
      ),
    );
  }
}

class _TrackingHistorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Tracking History',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        _buildOrderStatusTile('Order Confirmed', true),
        _buildOrderStatusTile('Preparing your order', true),
        _buildOrderStatusTile('Shipping', true),
        _buildOrderStatusTile('Out for delivery', true),
        _buildOrderStatusTile('Delivered', false),
        ListTile(
          title: Text('Delivery Name'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Address: Delivery Address'),
              Text('Phone: Delivery Phone Number'),
            ],
          ),
          leading: CircleAvatar(
            // Delivery photo
            backgroundColor: Color(0xFF9E090F),
            child: Icon(Icons.person, color: Colors.white),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.phone, color: Color(0xFF9E090F)),
              SizedBox(width: 8),
              Icon(Icons.directions, color: Color(0xFF9E090F)),
            ],
          ),
        ), // Change to false to show 'In process' icon
        // Add more status tiles here if needed
      ],
    );
  }

  // Helper method to build each order status tile
  Widget _buildOrderStatusTile(String title, bool isCompleted) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20, // Reduce the size of the circle avatar
        backgroundColor: isCompleted ? Color(0xFF9E090F) : Colors.grey,
        child: isCompleted
            ? Icon(Icons.check, color: Colors.white)
            : Icon(Icons.hourglass_empty, color: Colors.white),
      ),
      title: Text(title),
    );
  }
}
