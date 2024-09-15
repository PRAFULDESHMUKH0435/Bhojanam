import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Providers/HomeScreenProvider.dart';
import 'package:untitled2/Res/Constants/FoodDeliveryWidget.dart';
import 'package:untitled2/View/RestaurantScreen.dart';
import '../Res/Drawer.dart';
import 'TiffinProviderScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tiffin Service Tracker'),
        backgroundColor: Colors.orangeAccent,
        actions: [
          /// Search Icon
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => TiffinProvidersScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    final offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView( // Enable vertical scrolling
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align contents to the start
            children: [
              // Today's Menu Section
              Container(
                height: MediaQuery.of(context).size.height * 0.20, // 20% of screen height
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('assets/Images/one.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Today\'s Menu: ${provider.todaysMenu}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Order Delivery Status
              FoodDeliveryWidget(
                  orderdelivered: provider.orderdelivered,
                  DeliveryAgentName: provider.DeliveryAgentName,
                  DeliveryTime: provider.DeliveryTime,
                  DeliveryPersonNumber: provider.DeliveryPersonNumber,
                  DeliveryPersonLocate: provider.DeliveryPersonLocate),
              SizedBox(height: 20),

              // Browse Restaurants and See All
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Browse Restaurants",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to TiffinProvidersScreen on clicking See All
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TiffinProvidersScreen()),
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Horizontal Scroll for Restaurants
              Container(
                height: 200, // Set height to contain the horizontal scroll view
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: provider.tiffinProviders.map((restra) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantPage(
                            imageUrls: restra['imageurls']!,
                            shopName: restra['name']!,
                            shopLocality: restra['locality']!,
                            shopLocation: restra['location']!,
                            shopContact: restra['contactno']!,
                            shopDescription: restra['description']!)));
                      },
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Provider Image
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(restra['imageurls']![0]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            // Provider Name and Location
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    restra['name']!,
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    restra['locality']!,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey[800]),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 5),
                                  GestureDetector(
                                    onTap: () => HomeScreenProvider.launchGoogleMaps(restra['location']!),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.location_on, color: Colors.blue, size: 16),
                                        SizedBox(width: 5),
                                        Text(
                                          'Location',
                                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),

              // Food Quotes Carousel
              Container(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 100.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                  ),
                  items: provider.foodQuotes.map((quote) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          quote,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
