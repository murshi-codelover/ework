import 'package:hive/hive.dart';

part 'workmodel.g.dart'; // This file is generated automatically.

@HiveType(typeId: 0) // Use a unique typeId for each model.
class WorkModel extends HiveObject {
  @HiveField(0)
  String? date;

  @HiveField(1)
  String? time;

  @HiveField(2)
  String? location;

  @HiveField(3)
  String? wage;

  @HiveField(4)
  String? work;

  @HiveField(5)
  String? description;

  @HiveField(6)
  String? workers;

  @HiveField(7)
  int registeredWorkers = 0;

  WorkModel({
    this.date,
    this.time,
    this.location,
    this.wage,
    this.work,
    this.description,
    this.workers,
    this.registeredWorkers = 0,
  });

  // Factory constructor to create a WorkModel from a Map
  factory WorkModel.fromMap(Map<dynamic, dynamic> map) {
    return WorkModel(
      date: map['date'] as String?,
      time: map['time'] as String?,
      location: map['location'] as String?,
      wage: map['wage'] as String?,
      work: map['work'] as String?,
      description: map['description'] as String?,
      workers: map['workers'] as String?,
    );
  }

  // Method to convert a WorkModel into a Map
  Map<String, dynamic> toMap() {
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
}
