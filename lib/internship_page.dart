import 'package:flutter/material.dart';
import 'package:internshala_clone/fliter_city.dart';
import 'package:internshala_clone/internship_card.dart';


class InternshipPage extends StatelessWidget {
  const InternshipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internships'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Implement filter logic
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FilterScreen()));
            },
          ),
        ],
      ),
      body: ListView(
        children: const [
          InternshipCard(
            title: 'Content Acquisition',
            company: 'Hungama Digital Media Entertainment Private Limited',
            location: 'Mumbai',
            duration: '3 Months',
            stipend: '₹ 5,000/month',
          ),
          // Add more InternshipCard widgets here
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Internships',
          ),
          // Add more BottomNavigationBarItem widgets here
        ],
      ),
    );
  }
}