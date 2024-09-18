import 'package:flutter/material.dart';
import 'package:internshala_clone/API/internship_api.dart';
import 'package:internshala_clone/Different_Sections.dart/course.dart';
import 'package:internshala_clone/Different_Sections.dart/jobs.dart';
import 'package:internshala_clone/Different_Sections.dart/more.dart';
import 'package:internshala_clone/Model/internship_detail.dart';
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
  int _selectedIndex = 0;
  String? selectedProfile;
  String? selectedCity;
  String? selectedDuration;
  // Pages corresponding to each bottom navigation item
  static final List<Widget> _pages = <Widget>[
    InternshipPage(),
    JobsPage(),
    CoursesPage(),
    MorePage(),
  ];
  late Future<InternshipList> futureInternshipList;

  @override
  void initState() {
    super.initState();
    futureInternshipList = ApiService().fetchInternships();
  }

  List<Internship> filterInternships(
    Map<String, Internship> internshipsMeta,
    String? profile,
    String? city,
    String? duration,
  ) {
    List<Internship> filteredInternships = [];

    internshipsMeta.forEach((id, internship) {
      bool profileMatches =
          profile == null || internship.profileName == profile;
      bool cityMatches =
          city == null || internship.locationNames.contains(city);
      bool durationMatches = duration == null ||
          (internship.duration != null && internship.duration == duration);

      if (profileMatches || cityMatches || durationMatches) {
        filteredInternships.add(internship);
      }
    });

    print("nw $filteredInternships");
    return filteredInternships;
  }

  void _onFilterPressed() async {
    // Implement filter logic
    var result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FilterScreen(),
      ),
    );

    // Update filtering criteria based on user selections
    if (result != null && result is Map<String, String>) {
      setState(() {
        selectedProfile = result['profiles'] ?? '';
        selectedCity = result['cities'] ?? '';
        selectedDuration = result['duration'] ?? '';
      });

      // Fetch and filter internships based on the selected criteria
      _fetchAndFilterInternships();
    }
  }

  Future<void> _fetchAndFilterInternships() async {
    try {
      var internshipList = await ApiService().fetchInternships();
      print('Fetched internships: $internshipList');

      var filteredInternships = filterInternships(
        internshipList.internshipsMeta,
        selectedProfile,
        selectedCity,
        selectedDuration,
      );

      var updatedInternshipList = InternshipList(
        internshipIds:
            filteredInternships.map((internship) => internship.id).toList(),
        internshipsMeta: Map.fromEntries(
          filteredInternships.map((internship) => MapEntry(
                internship.id.toString(),
                internship,
              )),
        ),
      );

      setState(() {
        futureInternshipList = Future.value(updatedInternshipList);
      });
    } catch (error) {
      // Handle error fetching internships
      print('Error fetching internships: $error');
    }
  }

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
              _onFilterPressed();
            },
          ),
          Expanded(
            child: FutureBuilder<InternshipList>(
              future: futureInternshipList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListView.builder(
                    itemCount: 6,
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center, color: Colors.black),
            activeIcon: Icon(Icons.business_center, color: Colors.blue),
            label: 'Internships',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work, color: Colors.black),
            activeIcon: Icon(Icons.work, color: Colors.blue),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school, color: Colors.black),
            activeIcon: Icon(Icons.school, color: Colors.blue),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz, color: Colors.black),
            activeIcon: Icon(Icons.more_horiz, color: Colors.blue),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
