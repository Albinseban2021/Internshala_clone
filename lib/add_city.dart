import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> cities = [
    'Agartala', 'Agra', 'Ahmedabad', 'Bandra', 'Delhi',
    'Mumbai', // ... add all cities
  ];
  List<String> filteredCities = [];
  Map<String, bool> selectedCities = {};

  @override
  void initState() {
    super.initState();
    filteredCities = cities;
    cities.forEach((city) {
      selectedCities[city] = false;
    });
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredCities = cities;
      });
    } else {
      List<String> dummySearchList = [];
      cities.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          dummySearchList.add(item);
        }
      });
      setState(() {
        filteredCities = dummySearchList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City'),
        actions: [
          TextButton(
            onPressed: () {
              // Clear all selections
              setState(() {
                selectedCities.updateAll((key, value) => false);
              });
            },
            child: const Text(
              'Clear all',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              // Apply selections
              // TODO: Implement apply logic
            },
            child: const Text(
              'Apply',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterSearchResults,
              decoration: const InputDecoration(
                labelText: "Search city",
                hintText: "Search city",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCities.length,
              itemBuilder: (context, index) {
                String city = filteredCities[index];
                return CheckboxListTile(
                  title: Text(city),
                  value: selectedCities[city],
                  onChanged: (bool? value) {
                    setState(() {
                      selectedCities[city] = value!;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}