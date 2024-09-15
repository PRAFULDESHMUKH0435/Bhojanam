import 'package:flutter/material.dart';
import 'package:untitled2/Providers/HomeScreenProvider.dart';
class FoodDeliveryWidget extends StatefulWidget {
  bool orderdelivered;
  String DeliveryAgentName;
  String DeliveryTime;
  String DeliveryPersonNumber;
  String DeliveryPersonLocate;

  FoodDeliveryWidget({super.key,required this.orderdelivered,required this.DeliveryAgentName,required this.DeliveryTime,required this.DeliveryPersonNumber,required this.DeliveryPersonLocate});

  @override
  State<FoodDeliveryWidget> createState() => _FoodDeliveryWidgetState();
}

class _FoodDeliveryWidgetState extends State<FoodDeliveryWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          // Delivery Agent Image
          Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(
                    'assets/Images/two.jpg'), // Replace with delivery agent image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          // Delivery Agent Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivered by: ${widget.DeliveryAgentName}',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                widget.orderdelivered ?Row(
                  children: [
                    Text(
                      'Delivery Person',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () =>HomeScreenProvider.launchCaller(widget.DeliveryPersonNumber), // Replace with actual phone number
                      child: Row(
                        children: [
                          Icon(Icons.phone, color: Colors.green),
                          SizedBox(width: 5),
                          Text('Call'),
                        ],
                      ),
                    ),
                  ],
                ):Row(
                  children: [
                    GestureDetector(
                      onTap: () =>HomeScreenProvider.launchCaller(widget.DeliveryPersonNumber), // Replace with actual phone number
                      child: Row(
                        children: [
                          Icon(Icons.phone, color: Colors.green),
                          SizedBox(width: 5),
                          Text('Call'),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () =>HomeScreenProvider.launchGoogleMaps("https://www.google.com/maps/dir//50,+Gangabai+Ghat+Rd,+Itwari,+Telephone+Exchange+Chowk,+Mangalwari,+Bagadganj,+Nagpur,+Maharashtra+440008/@21.1353968,79.0314226,11.8z/data=!4m8!4m7!1m0!1m5!1m1!1s0x3bd4c74821637f69:0x726f19826bc65fa5!2m2!1d79.1193892!2d21.1467476?entry=ttu&g_ep=EgoyMDI0MDgyOC4wIKXMDSoASAFQAw%3D%3D"),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.blue),
                          SizedBox(width: 5),
                          Text('Track'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                widget.orderdelivered?Text(
                  'Delived On: ${widget.DeliveryTime}', // Displaying estimated delivery time
                  style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold),
                ):  Text(
                  'Estimated Delivery: ${widget.DeliveryTime}', // Displaying estimated delivery time
                  style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
