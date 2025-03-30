import 'package:cloud_firestore/cloud_firestore.dart';

class WorkRegistration {
  final String id; // Firestore Document ID
  final String userId;
  final String work;
  final String date;
  final String location;
  final String wage;
  final String description;
  final String workers;
  final String time;
  final Timestamp registeredAt;

  WorkRegistration({
    required this.id,
    required this.userId,
    required this.work,
    required this.date,
    required this.location,
    required this.wage,
    required this.description,
    required this.workers,
    required this.time,
    required this.registeredAt,
  });

  // 🔥 Convert Firestore document to WorkRegistration object
  factory WorkRegistration.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return WorkRegistration(
      id: doc.id,
      userId: data['userId'] ?? '',
      work: data['work'] ?? '',
      date: data['date'] ?? '',
      location: data['location'] ?? '',
      wage: data['wage'] ?? '',
      description: data['description'] ?? '',
      workers: data['workers'] ?? '',
      time: data['time'] ?? '',
      registeredAt: data['registeredAt'] ?? Timestamp.now(),
    );
  }

  // 🔥 Convert WorkRegistration object to Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'work': work,
      'date': date,
      'location': location,
      'wage': wage,
      'description': description,
      'workers': workers,
      'time': time,
      'registeredAt': registeredAt,
    };
  }
}
