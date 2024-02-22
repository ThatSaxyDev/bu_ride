import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DriverModel {
  final String id;
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String vatNumber;
  final String phoneNumber;
  final DateTime dateJoined;
  final DateTime dateJUpdated;
  final bool isAvailable;

  const DriverModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.vatNumber,
    required this.phoneNumber,
    required this.dateJoined,
    required this.dateJUpdated,
    required this.isAvailable,
  });

  DriverModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? emailAddress,
    String? vatNumber,
    String? phoneNumber,
    DateTime? dateJoined,
    DateTime? dateJUpdated,
    bool? isAvailable,
  }) {
    return DriverModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      emailAddress: emailAddress ?? this.emailAddress,
      vatNumber: vatNumber ?? this.vatNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateJoined: dateJoined ?? this.dateJoined,
      dateJUpdated: dateJUpdated ?? this.dateJUpdated,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  @override
  String toString() {
    return 'DriverModel(id: $id, firstName: $firstName, lastName: $lastName, emailAddress: $emailAddress, vatNumber: $vatNumber, phoneNumber: $phoneNumber, dateJoined: $dateJoined, dateJUpdated: $dateJUpdated, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(covariant DriverModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.emailAddress == emailAddress &&
        other.vatNumber == vatNumber &&
        other.phoneNumber == phoneNumber &&
        other.dateJoined == dateJoined &&
        other.dateJUpdated == dateJUpdated &&
        other.isAvailable == isAvailable;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        emailAddress.hashCode ^
        vatNumber.hashCode ^
        phoneNumber.hashCode ^
        dateJoined.hashCode ^
        dateJUpdated.hashCode ^
        isAvailable.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'emailAddress': emailAddress,
      'vatNumber': vatNumber,
      'phoneNumber': phoneNumber,
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
      phoneNumber: (map["phoneNumber"] ?? '') as String,
      vatNumber: (map["vatNumber"] ?? '') as String,
      dateJoined: DateTime.parse(map['dateJoined']),
      dateJUpdated: DateTime.parse(map['dateJUpdated']),
      isAvailable: (map["isAvailable"] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverModel.fromJson(String source) =>
      DriverModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
