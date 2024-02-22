import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DriverModel {
  final String id;
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String vatNumber;
  final DateTime dateJoined;
  final DateTime dateJUpdated;

  const DriverModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.vatNumber,
    required this.dateJoined,
    required this.dateJUpdated,
  });

  DriverModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? emailAddress,
    String? vatNumber,
    DateTime? dateJoined,
    DateTime? dateJUpdated,
  }) {
    return DriverModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      emailAddress: emailAddress ?? this.emailAddress,
      vatNumber: vatNumber ?? this.vatNumber,
      dateJoined: dateJoined ?? this.dateJoined,
      dateJUpdated: dateJUpdated ?? this.dateJUpdated,
    );
  }

  @override
  String toString() {
    return 'DriverModel(id: $id, firstName: $firstName, lastName: $lastName, emailAddress: $emailAddress, vatNumber: $vatNumber, dateJoined: $dateJoined, dateJUpdated: $dateJUpdated)';
  }

  @override
  bool operator ==(covariant DriverModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.emailAddress == emailAddress &&
        other.vatNumber == vatNumber &&
        other.dateJoined == dateJoined &&
        other.dateJUpdated == dateJUpdated;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        emailAddress.hashCode ^
        vatNumber.hashCode ^
        dateJoined.hashCode ^
        dateJUpdated.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'emailAddress': emailAddress,
      'vatNumber': vatNumber,
      'dateJoined': dateJoined.toString(),
      'dateJUpdated': dateJUpdated.toString(),
    };
  }

  factory DriverModel.fromMap(Map<String, dynamic> map) {
    return DriverModel(
      id: (map["id"] ?? '') as String,
      firstName: (map["firstName"] ?? '') as String,
      lastName: (map["lastName"] ?? '') as String,
      emailAddress: (map["emailAddress"] ?? '') as String,
      vatNumber: (map["vatNumber"] ?? '') as String,
      dateJoined: DateTime.parse(map['dateJoined']),
      dateJUpdated: DateTime.parse(map['dateJUpdated']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverModel.fromJson(String source) =>
      DriverModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
