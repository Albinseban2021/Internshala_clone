import 'package:flutter/material.dart';

class CheckBoxList extends StatefulWidget {
  final String title;
  final List<String> items;

  const CheckBoxList({super.key, required this.title, required this.items});

  @override
  _CheckBoxListState createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  TextEditingController searchController = TextEditingController();
  //List<String> items = ;
  List<String> filteredItems = [];
  Map<String, bool> selectedItems = {};

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
    widget.items.forEach((data) {
      selectedItems[data] = false;
    });
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredItems = widget.items;
      });
    } else {
      List<String> dummySearchList = [];
      widget.items.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          dummySearchList.add(item);
        }
      });
      setState(() {
        filteredItems = dummySearchList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          TextButton(
            onPressed: () {
              // Clear all selections
              setState(() {
                selectedItems.updateAll((key, value) => false);
              });
            },
            child: const Text(
              'Clear all',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              List<String> selectedOptions = [];
              selectedItems.forEach((key, value) {
                if (value) {
                  selectedOptions.add(key);
                }
              });

              Navigator.of(context).pop(selectedOptions);
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
              decoration: InputDecoration(
                labelText: "Search ${widget.title}",
                hintText: "Search ${widget.title}",
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                String data = filteredItems[index];
                return CheckboxListTile(
                  title: Text(data),
                  value: selectedItems[data],
                  onChanged: (bool? value) {
                    setState(() {
                      selectedItems[data] = value!;
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
