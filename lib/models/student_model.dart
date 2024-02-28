import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StudentModel {
  final String id;
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String phoneNumber;
  final DateTime dateJoined;
  final DateTime dateJUpdated;
  final bool inARide;

  const StudentModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.dateJoined,
    required this.dateJUpdated,
    required this.inARide,
  });

  StudentModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? emailAddress,
    String? phoneNumber,
    DateTime? dateJoined,
    DateTime? dateJUpdated,
    bool? inARide,
  }) {
    return StudentModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateJoined: dateJoined ?? this.dateJoined,
      dateJUpdated: dateJUpdated ?? this.dateJUpdated,
      inARide: inARide ?? this.inARide,
    );
  }

  @override
  String toString() {
    return 'StudentModel(id: $id, firstName: $firstName, lastName: $lastName, emailAddress: $emailAddress, phoneNumber: $phoneNumber, dateJoined: $dateJoined, dateJUpdated: $dateJUpdated, inARide: $inARide)';
  }

  @override
  bool operator ==(covariant StudentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.emailAddress == emailAddress &&
        other.phoneNumber == phoneNumber &&
        other.dateJoined == dateJoined &&
        other.dateJUpdated == dateJUpdated &&
        other.inARide == inARide;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        emailAddress.hashCode ^
        phoneNumber.hashCode ^
        dateJoined.hashCode ^
        dateJUpdated.hashCode ^
        inARide.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'emailAddress': emailAddress,
      'inARide': inARide,
      'phoneNumber': phoneNumber,
      'dateJoined': dateJoined.toString(),
      'dateJUpdated': dateJUpdated.toString(),
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: (map["id"] ?? '') as String,
      firstName: (map["firstName"] ?? '') as String,
      lastName: (map["lastName"] ?? '') as String,
      emailAddress: (map["emailAddress"] ?? '') as String,
      phoneNumber: (map["phoneNumber"] ?? '') as String,
      dateJoined: DateTime.parse(map['dateJoined']),
      dateJUpdated: DateTime.parse(map['dateJUpdated']),
      inARide: (map["inARide"] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
