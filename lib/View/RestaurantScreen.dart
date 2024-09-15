import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantPage extends StatefulWidget {
  final List<String> imageUrls;
  final String shopName;
  final String shopLocality;
  final String shopLocation;
  final String shopContact;
  final String shopDescription;

  const RestaurantPage({
    Key? key,
    required this.imageUrls,
    required this.shopName,
    required this.shopLocality,
    required this.shopLocation,
    required this.shopContact,
    required this.shopDescription,
  }) : super(key: key);

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  String _selectedImageUrl = '';

  @override
  void initState() {
    super.initState();
    _selectedImageUrl = widget.imageUrls[0]; // Default to the first image in the list
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showFullScreenImage(String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black.withOpacity(0.85),
          insetPadding: EdgeInsets.all(0),
          child: Stack(
            children: [
              // Full-screen image
              Center(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              // Close button
              Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shopName),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Image
            GestureDetector(
              onTap: () {
                _showFullScreenImage(_selectedImageUrl); // Open the image in full screen on tap
              },
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(_selectedImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shop Name
                  Text(
                    widget.shopName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Shop Locality
                  Text(
                    widget.shopLocality,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 20),
                  // List of Images
                  SizedBox(
                    height: 100, // Adjust height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.imageUrls.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedImageUrl = widget.imageUrls[index];
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            width: 100, // Adjust the width as needed
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(widget.imageUrls[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  // Shop Description
                  Text(
                    widget.shopDescription,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orangeAccent, // Same color as AppBar
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        onTap: (index) {
          if (index == 0) {
            // Call action
            _launchURL('tel:${widget.shopContact}');
          } else if (index == 1) {
            // Location action
            _launchURL('https://www.google.com/maps/search/?api=1&query=${widget.shopLocation}');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Directions',
          ),
        ],
      ),
    );
  }
}
