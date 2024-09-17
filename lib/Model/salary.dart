class Stipend {
  String salary;

  Stipend({
    required this.salary,
  });
  factory Stipend.fromJson(Map<String, dynamic> json) {
    return Stipend(
      salary: json['salary'] ?? '',
      // Other stipend-related fields...
    );
  }
}