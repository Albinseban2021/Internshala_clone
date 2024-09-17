import 'package:internshala_clone/Model/internship_detail.dart';

class InternshipList {
  Map<String, Internship> internshipsMeta;
  List<int> internshipIds;

  InternshipList({required this.internshipsMeta, required this.internshipIds});

  factory InternshipList.fromJson(Map<String, dynamic> json) {
    Map<String, Internship> internshipsMeta = {};
    json['internships_meta'].forEach((key, value) {
      internshipsMeta[key] = Internship.fromJson(value);
    });
    return InternshipList(
      internshipsMeta: internshipsMeta,
      internshipIds: List<int>.from(json['internship_ids']),
    );
  }
}
