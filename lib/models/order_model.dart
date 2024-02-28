// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderModel {
  final String id;
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String pickUpLocation;
  final String destination;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int passengerCount;
  final String driverId;
  final String driverFirstName;
  final String driverLastName;
  final DateTime pickUpDate;
  final TimeOfDay pickUpTime;

  const OrderModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.pickUpLocation,
    required this.destination,
    required this.createdAt,
    required this.updatedAt,
    required this.passengerCount,
    required this.driverId,
    required this.driverFirstName,
    required this.driverLastName,
    required this.pickUpDate,
    required this.pickUpTime,
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
    int? passengerCount,
    String? driverId,
    String? driverFirstName,
    String? driverLastName,
    DateTime? pickUpDate,
    TimeOfDay? pickUpTime,
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
      passengerCount: passengerCount ?? this.passengerCount,
      driverId: driverId ?? this.driverId,
      driverFirstName: driverFirstName ?? this.driverFirstName,
      driverLastName: driverLastName ?? this.driverLastName,
      pickUpDate: pickUpDate ?? this.pickUpDate,
      pickUpTime: pickUpTime ?? this.pickUpTime,
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
      'passengerCount': passengerCount,
      'driverId': driverId,
      'driverFirstName': driverFirstName,
      'driverLastName': driverLastName,
      'pickUpDate': pickUpDate.toString(),
      'pickUpTime': formatTimeOfDay(pickUpTime),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    String pickUpTimeString = map['pickUpTime'].toString();
    DateFormat format = DateFormat("hh:mm a");
    DateTime pickUpTimee = format.parse(pickUpTimeString);

    // Convert to TimeOfDay
    TimeOfDay pickUpTime = TimeOfDay.fromDateTime(pickUpTimee);
    return OrderModel(
      id: (map["id"] ?? '') as String,
      firstName: (map["firstName"] ?? '') as String,
      lastName: (map["lastName"] ?? '') as String,
      emailAddress: (map["emailAddress"] ?? '') as String,
      pickUpLocation: (map["pickUpLocation"] ?? '') as String,
      destination: (map["destination"] ?? '') as String,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      passengerCount: (map["passengerCount"] ?? 0) as int,
      driverId: (map["driverId"] ?? '') as String,
      driverFirstName: (map["driverFirstName"] ?? '') as String,
      driverLastName: (map["driverLastName"] ?? '') as String,
      pickUpDate: DateTime.parse(map['pickUpDate']),
      pickUpTime: pickUpTime,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, firstName: $firstName, lastName: $lastName, emailAddress: $emailAddress, pickUpLocation: $pickUpLocation, destination: $destination, createdAt: $createdAt, updatedAt: $updatedAt, passengerCount: $passengerCount, driverId: $driverId, driverFirstName: $driverFirstName, driverLastName: $driverLastName, pickUpDate: $pickUpDate, pickUpTime: $pickUpTime)';
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
        other.updatedAt == updatedAt &&
        other.passengerCount == passengerCount &&
        other.driverId == driverId &&
        other.driverFirstName == driverFirstName &&
        other.driverLastName == driverLastName &&
        other.pickUpDate == pickUpDate &&
        other.pickUpTime == pickUpTime;
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
        updatedAt.hashCode ^
        passengerCount.hashCode ^
        driverId.hashCode ^
        driverFirstName.hashCode ^
        driverLastName.hashCode ^
        pickUpDate.hashCode ^
        pickUpTime.hashCode;
  }
}


String formatTimeOfDay(TimeOfDay timeOfDay) {
  final now = DateTime.now();
  final DateTime dateTime =
      DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  final DateFormat formatter = DateFormat('hh:mm a');
  return formatter.format(dateTime);
}
