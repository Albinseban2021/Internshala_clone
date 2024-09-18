import 'package:flutter/material.dart';
import 'package:internshala_clone/checkbox.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  DateTime? selectedDate;
  int? selectedDuration;
  Map<String, String> selectedFilters = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              // Add your add profile logic here
              final selectedProfiles =
                  await Navigator.of(context).push<List<String>>(
                MaterialPageRoute(
                  builder: (context) => const CheckBoxList(
                    items: [
                      'Administration',
                      'Android App Development',
                      'Business Analytics',
                      'Brand Management',
                      'Data Science',
                      'Product Management'
                    ],
                    title: "Profile",
                  ),
                ),
              );
              if (selectedProfiles != null &&
                  selectedProfiles is List<String>) {
                print("Selected Profiles: $selectedProfiles");
                selectedFilters['profiles'] = selectedProfiles.join(", ");
              }

              // Do something with the selected profiles
            },
            icon: const Icon(Icons.add),
            label: const Text('Add profile'),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              // Add your add city logic here
              final selectedCities =
                  await Navigator.of(context).push<List<String>>(
                MaterialPageRoute(
                  builder: (context) => const CheckBoxList(
                    items: [
                      'Agartala',
                      'Agra',
                      'Ahmedabad',
                      'Bandra',
                      'Bengaluru',
                      'Delhi',
                      'Gurgaon',
                      'Lucknow',
                      'Mumbai',
                      'Munnar',
                      'Noida',
                      'Parbhani',
                      'Kera',
                      'Tarn Taran'
                    ],
                    title: "City",
                  ),
                ),
              );

              // Do something with the selected profiles

              if (selectedCities != null && selectedCities is List<String>) {
                print("Selected City: $selectedCities");
                selectedFilters['cities'] = selectedCities.join(", ");
              }
            },
            icon: const Icon(Icons.add),
            label: const Text('Add city'),
          ),
          DropdownButton<int>(
            isExpanded: true,
            value: selectedDuration,
            hint: const Text('Choose Duration'),
            onChanged: (int? newValue) {
              setState(() {
                selectedDuration = newValue;
              });
            },
            items:
                <int>[1, 2, 3, 4, 5, 6].map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text('$value month${value > 1 ? 's' : ''}'),
              );
            }).toList(),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Implement clear all filters logic
                    setState(() {
                      selectedFilters.clear();
                      selectedDuration = null;
                    });
                  },
                  child: const Text('Clear all'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Implement apply filters logic
                    selectedFilters['duration'] =
                        selectedDuration?.toString() ?? "";
                    Navigator.pop(context, selectedFilters);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
