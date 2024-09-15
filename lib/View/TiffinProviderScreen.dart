import 'package:flutter/material.dart';

class TiffinProvidersScreen extends StatefulWidget {
  @override
  _TiffinProvidersScreenState createState() => _TiffinProvidersScreenState();
}

class _TiffinProvidersScreenState extends State<TiffinProvidersScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _searchHistory = [];
  // final List<Map<String, String>> _allProviders = [
  //   {
  //     'name': 'Annapurna Bhojnalay',
  //     'location': 'Laxmi Nagar',
  //     'price': '₹100',
  //     'image': 'assets/Images/one.jpg',
  //   },
  //   {
  //     'name': 'SuryaKantSaoji',
  //     'location': 'Shankar Nagar',
  //     'price': '₹120',
  //     'image': 'assets/Images/two.jpg',
  //   },
  //   {
  //     'name': 'Aayushi Paratha',
  //     'location': 'Ram Nagar',
  //     'price': '₹80',
  //     'image': 'assets/Images/three.jpg',
  //   },
  //   // Add more providers as needed
  // ];



  final List<Map<String, String>> _allProviders = [
    {
      'name': 'Annapurna Bhojnalay',
      'location': 'Laxmi Nagar',
      'price': '₹100',
      'image': 'assets/Images/one.jpg',
    },
    {
      'name': 'SuryaKantSaoji',
      'location': 'Shankar Nagar',
      'price': '₹120',
      'image': 'assets/Images/two.jpg',
    },
    {
      'name': 'Aayushi Paratha',
      'location': 'Ram Nagar',
      'price': '₹80',
      'image': 'assets/Images/three.jpg',
    },
    // Add more providers as needed
  ];
  List<Map<String, String>> _filteredProviders = [];

  @override
  void initState() {
    super.initState();
    _filteredProviders = _allProviders;
  }

  void _filterProviders(String query) {
    setState(() {
      _filteredProviders = _allProviders
          .where((provider) =>
      provider['name']!.toLowerCase().contains(query.toLowerCase()) ||
          provider['location']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });

    if (!_searchHistory.contains(query) && query.isNotEmpty) {
      setState(() {
        _searchHistory.add(query);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Tiffin Providers'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Animated Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter Locality ,Get भोजनालय',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: _filterProviders,
            ),
            SizedBox(height: 10),
            // List of Tiffin Providers
            Expanded(
              child: ListView.builder(
                itemCount: _filteredProviders.length,
                itemBuilder: (context, index) {
                  final provider = _filteredProviders[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Image.asset(
                        provider['image']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(provider['name']!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(provider['location']!),
                          SizedBox(height: 5),
                          Text(
                            'Price: ${provider['price']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      onTap: () {
                        // Handle tapping on a provider (e.g., navigate to provider details screen)
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
