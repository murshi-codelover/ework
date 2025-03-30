class WorkModel {
  String? id; // Firestore document ID
  String date, time, location, wage, work, description, workers;

  WorkModel({
    this.id,
    required this.date,
    required this.time,
    required this.location,
    required this.wage,
    required this.work,
    required this.description,
    required this.workers,
  });

  // Convert object to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'time': time,
      'location': location,
      'wage': wage,
      'work': work,
      'description': description,
      'workers': workers,
    };
  }

  // Convert Firestore JSON to WorkModel
  factory WorkModel.fromJson(Map<String, dynamic> json) {
    return WorkModel(
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      location: json['location'] ?? '',
      wage: json['wage'] ?? '',
      work: json['work'] ?? '',
      description: json['description'] ?? '',
      workers: json['workers'] ?? '',
    );
  }
}
