import 'package:cloud_firestore/cloud_firestore.dart';

class WorkModel {
  final String? id;
  final String work;
  final String date;
  final String time;
  final String location;
  final String wage;
  final String description;
  final String workers;

  WorkModel({
    this.id,
    required this.work,
    required this.date,
    required this.time,
    required this.location,
    required this.wage,
    required this.description,
    required this.workers,
  });

  /// Convert WorkModel to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'work': work,
      'date': date,
      'time': time,
      'location': location,
      'wage': wage,
      'description': description,
      'workers': workers,
    };
  }

  /// Factory constructor to create WorkModel from Firestore document
  factory WorkModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>? ?? {};
    return WorkModel(
      id: doc.id, // Use Firestore document ID
      work: data['work'] ?? 'Unknown Work',
      date: data['date'] ?? 'N/A',
      time: data['time'] ?? 'N/A',
      location: data['location'] ?? 'Unknown Location',
      wage: data['wage'] ?? '0',
      description: data['description'] ?? 'No Description',
      workers: data['workers'] ?? '0',
    );
  }

  /// Create a copy with updated values
  WorkModel copyWith({
    String? id,
    String? work,
    String? date,
    String? time,
    String? location,
    String? wage,
    String? description,
    String? workers,
  }) {
    return WorkModel(
      id: id ?? this.id,
      work: work ?? this.work,
      date: date ?? this.date,
      time: time ?? this.time,
      location: location ?? this.location,
      wage: wage ?? this.wage,
      description: description ?? this.description,
      workers: workers ?? this.workers,
    );
  }
}
