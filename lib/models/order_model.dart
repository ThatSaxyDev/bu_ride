// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderModel {
  final String id;
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String pickUpLocation;
  final String destination;
  final DateTime createdAt;
  final DateTime updatedAt;

  const OrderModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.pickUpLocation,
    required this.destination,
    required this.createdAt,
    required this.updatedAt,
  });

  OrderModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? emailAddress,
    String? pickUpLocation,
    String? destination,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OrderModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      emailAddress: emailAddress ?? this.emailAddress,
      pickUpLocation: pickUpLocation ?? this.pickUpLocation,
      destination: destination ?? this.destination,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'emailAddress': emailAddress,
      'pickUpLocation': pickUpLocation,
      'destination': destination,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: (map["id"] ?? '') as String,
      firstName: (map["firstName"] ?? '') as String,
      lastName: (map["lastName"] ?? '') as String,
      emailAddress: (map["emailAddress"] ?? '') as String,
      pickUpLocation: (map["pickUpLocation"] ?? '') as String,
      destination: (map["destination"] ?? '') as String,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, firstName: $firstName, lastName: $lastName, emailAddress: $emailAddress, pickUpLocation: $pickUpLocation, destination: $destination, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.emailAddress == emailAddress &&
        other.pickUpLocation == pickUpLocation &&
        other.destination == destination &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        emailAddress.hashCode ^
        pickUpLocation.hashCode ^
        destination.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
