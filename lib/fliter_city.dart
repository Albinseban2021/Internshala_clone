import 'package:flutter/material.dart';
import 'package:internshala_clone/add_city.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool workFromHome = false;
  bool partTime = false;
  RangeValues stipendRange = RangeValues(2000, 10000);
  DateTime? selectedDate;
  int? selectedDuration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton.icon(
            onPressed: () {
              // Add your add profile logic here
            },
            icon: const Icon(Icons.add),
            label: const Text('Add profile'),
          ),
          ElevatedButton.icon(
            onPressed: () {
Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CityScreen()));
            },
            icon: const Icon(Icons.add),
            label: const Text('Add city'),
          ),
          CheckboxListTile(
            title: const Text('Work from home'),
            value: workFromHome,
            onChanged: (bool? value) {
              setState(() {
                workFromHome = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Part-time'),
            value: partTime,
            onChanged: (bool? value) {
              setState(() {
                partTime = value!;
              });
            },
          ),
          RangeSlider(
            values: stipendRange,
            min: 0,
            max: 10000,
            divisions: 5,
            labels: RangeLabels(
              '₹${stipendRange.start.round().toString()}',
              '₹${stipendRange.end.round().toString()}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                stipendRange = values;
              });
            },
          ),
          ListTile(
            title: ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != selectedDate)
                  setState(() {
                    selectedDate = picked;
                  });
              },
              child: Text(selectedDate == null
                  ? 'Choose Date'
                  : 'Date: ${selectedDate!.toLocal()}'.split(' ')[0]),
            ),
          ),
          DropdownButton<int>(
            isExpanded: true,
            value: selectedDuration,
            hint: Text('Choose Duration'),
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
                  },
                  child: Text('Clear all'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Implement apply filters logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text('Apply'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
