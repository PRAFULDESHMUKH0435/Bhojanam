import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
class HomeScreenProvider with ChangeNotifier{


  /// Data To Be Displayed
  final String todaysMenu = "Chapati, Dal, Rice, and Sabzi";
  final String DeliveryAgentName = "Praful Deshmukh";
  final String DeliveryTime = "12:30 PM"; // Added estimated delivery time
  final String DeliveryPersonNumber = "9359407730"; // Added estimated delivery time
  final String DeliveryPersonLocate = "Dighori Narsala Road Nagpur"; // Added estimated delivery time
  ///

  final List<Map<String, dynamic>> tiffinProviders = [
    {
      'name': 'Annapurna Bhojnalay',
      'locality': 'Laxmi Nagar',
      'image': 'assets/Images/annapurna.jpg',
      'location': 'https://goo.gl/maps/Annapurna',
      'contactno': '9359408852',
      'description': 'Best In Town With Legacy Of More Than 25 Years',
      'imageurls': [
        'https://content3.jdmagicbox.com/comp/nagpur/r1/0712px712.x712.180731135253.v9r1/catalogue/suryakant-saoji-central-avenue-road-nagpur-punjabi-restaurants-q8j6vl2rol.jpg',
        'https://content3.jdmagicbox.com/comp/nagpur/t7/0712px712.x712.220802210854.w7t7/catalogue/chefu-s-saoji-and-family-restaurant-subhash-nagar-nagpur-north-indian-delivery-restaurants-pezplq8zea.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRHN9eQmSSnQgM7NT5aRkNdo5XO3_5YDNPU1Aj1lYlSJP8khJOvckD1NUOtXLYuJ4VVYE&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUiEKT3S-qlptAoPvVX_uEU9xD1vvm6RPDU7YBtbAqcWPnv75brEjdkgP5DvX0x0YlNu0&usqp=CAU'
      ]
    },
    {
      'name': 'SuryaKant Saoji',
      'locality': 'Sadar',
      'image': 'assets/Images/tiffinprive.jpg',
      'location': 'https://goo.gl/maps/TiffinPrive',
      'contactno': '9359408852',
      'description': 'Best In Town With Legacy Of More Than 25 Years',
      'imageurls': [
        'https://content3.jdmagicbox.com/comp/nagpur/r1/0712px712.x712.180731135253.v9r1/catalogue/suryakant-saoji-central-avenue-road-nagpur-punjabi-restaurants-q8j6vl2rol.jpg',
        'https://content3.jdmagicbox.com/comp/nagpur/t7/0712px712.x712.220802210854.w7t7/catalogue/chefu-s-saoji-and-family-restaurant-subhash-nagar-nagpur-north-indian-delivery-restaurants-pezplq8zea.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRHN9eQmSSnQgM7NT5aRkNdo5XO3_5YDNPU1Aj1lYlSJP8khJOvckD1NUOtXLYuJ4VVYE&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUiEKT3S-qlptAoPvVX_uEU9xD1vvm6RPDU7YBtbAqcWPnv75brEjdkgP5DvX0x0YlNu0&usqp=CAU'
      ]
    },
    {
      'name': 'Aayushi Paratha',
      'locality': 'Gandhibagh',
      'image': 'assets/Images/provider3.jpg',
      'location': 'https://goo.gl/maps/Provider3',
      'contactno': '9359408852',
      'description': 'Best In Town With Legacy Of More Than 25 Years',
      'imageurls': [
        'https://content3.jdmagicbox.com/comp/nagpur/r1/0712px712.x712.180731135253.v9r1/catalogue/suryakant-saoji-central-avenue-road-nagpur-punjabi-restaurants-q8j6vl2rol.jpg',
        'https://content3.jdmagicbox.com/comp/nagpur/t7/0712px712.x712.220802210854.w7t7/catalogue/chefu-s-saoji-and-family-restaurant-subhash-nagar-nagpur-north-indian-delivery-restaurants-pezplq8zea.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRHN9eQmSSnQgM7NT5aRkNdo5XO3_5YDNPU1Aj1lYlSJP8khJOvckD1NUOtXLYuJ4VVYE&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUiEKT3S-qlptAoPvVX_uEU9xD1vvm6RPDU7YBtbAqcWPnv75brEjdkgP5DvX0x0YlNu0&usqp=CAU'
      ]
    }
  ];


  final List<String> foodQuotes = [
    "भोजन उतना ही लें थाली में, कि व्यर्थ न जाये नाली में",
    "अन्न हे पूर्णब्रम्ह",
    "Life is uncertain. Eat dessert first.",
  ];

  final List<String> sliderImages = [
    'assets/Images/one.jpg',
    'assets/Images/two.jpg',
    'assets/Images/three.jpg',
  ];


  bool _orderdelivered=false;
  bool get orderdelivered => _orderdelivered;
  set orderdelivered(bool value) {
    _orderdelivered = value;
  }



  static void launchCaller(String number) async {
    final url = 'tel:+91$number';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static  launchGoogleMaps(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}