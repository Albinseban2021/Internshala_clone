import 'package:internshala_clone/Model/salary.dart';

class Internship {
  int id;
  String profileName;
  String title;
  String duration;
  List<String> locationNames;
  bool workFromHome;
  String companyName;
  Stipend? stipend;

  Internship({
    required this.id,
    required this.profileName,
    required this.title,
    required this.duration,
    required this.locationNames,
    required this.workFromHome,
    required this.companyName,
    required this.stipend,
  });

  factory Internship.fromJson(Map<String, dynamic> json) {
    return Internship(
      id: json['id'],
      profileName: json['profile_name'],
      title: json['title'],
      duration: json['duration'],
      locationNames: List<String>.from(json['location_names']),
      workFromHome: json['work_from_home'],
      companyName: json['company_name'],
      stipend:
          json['stipend'] != null ? Stipend.fromJson(json['stipend']) : null,
    );
  }
}
