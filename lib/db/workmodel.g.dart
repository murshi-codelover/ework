// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkModelAdapter extends TypeAdapter<WorkModel> {
  @override
  final int typeId = 0;

  @override
  WorkModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkModel(
      date: fields[0] as String?,
      time: fields[1] as String?,
      location: fields[2] as String?,
      wage: fields[3] as String?,
      work: fields[4] as String?,
      description: fields[5] as String?,
      workers: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WorkModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.wage)
      ..writeByte(4)
      ..write(obj.work)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.workers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
