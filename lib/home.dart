import 'package:flutter/material.dart';
import 'package:internshala_clone/Different_Sections.dart/course.dart';
import 'package:internshala_clone/Different_Sections.dart/jobs.dart';
import 'package:internshala_clone/Different_Sections.dart/more.dart';
import 'package:internshala_clone/Model/internship_list.dart';
import 'package:internshala_clone/fliter_city.dart';
import 'package:internshala_clone/internship_card.dart';
import 'package:internshala_clone/shimmer.dart';

class InternshipPage extends StatefulWidget {
  const InternshipPage({super.key});

  @override
  State<InternshipPage> createState() => _InternshipPageState();
}

class _InternshipPageState extends State<InternshipPage> {
  int _selectedIndex = 0; // Default selected index for bottom navigation

  // Pages corresponding to each bottom navigation item
  static final List<Widget> _pages = <Widget>[
    InternshipPage(),
    JobsPage(),
    CoursesPage(),
    MorePage(),
  ];
  late Future<InternshipList> futureInternshipList;

  // @override
  // void initState() {
  //   super.initState();
  //   futureInternshipList = ApiService().fetchInternships();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            const Text('Internships'),
          ],
        ),
        actions: [
             IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.message_outlined)),
        ],
      ),
      body: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Implement filter logic
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FilterScreen()));
            },
          ),
          Expanded(
            child: FutureBuilder<InternshipList>(
              future: futureInternshipList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListView.builder(
                    itemCount: 6, // Number of shimmer items
                    itemBuilder: (BuildContext context, int index) {
                      return ShimmerEffect();
                    },
                  );
                } else if (snapshot.hasError) {
                  debugPrint('Error: ${snapshot.error}');
                  return const Center(child: Text("Some error occured"));
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.internshipIds.length,
                    itemBuilder: (context, index) {
                      var internship = snapshot.data!.internshipsMeta[
                          snapshot.data!.internshipIds[index].toString()]!;
                      return InternshipCard(
                        title: internship.title,
                        company: internship.companyName,
                        location: internship.locationNames.join(", "),
                        duration: internship.duration,
                        stipend: internship.stipend,
                        workFromHome: internship.workFromHome,
                      );
                      // Add more InternshipCard widgets here
                    },
                  );
                } else {
                  return const Center(child: Text('No data available'));
                }
              },
            ),
          ),
        ],
      ),
      // body: ListView(
      //   children: const [
      //     InternshipCard(
      //       title: 'Content Acquisition',
      //       company: 'Hungama Digital Media Entertainment Private Limited',
      //       location: 'Mumbai',
      //       duration: '3 Months',
      //       stipend: '₹ 5,000/month',
      //     ),
      //     // Add more InternshipCard widgets here
      //   ],
      // ),
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
