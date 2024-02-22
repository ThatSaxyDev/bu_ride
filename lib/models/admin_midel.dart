// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AdminModel {
  final String id;
  final String fullName;
  final String userName;
  final String emailAddress;
  final String phoneNumber;
  final String bio;
  final String profilePhoto;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AdminModel({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.bio,
    required this.profilePhoto,
    required this.createdAt,
    required this.updatedAt,
  });

  AdminModel copyWith({
    String? id,
    String? fullName,
    String? userName,
    String? emailAddress,
    String? phoneNumber,
    String? bio,
    String? profilePhoto,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AdminModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      userName: userName ?? this.userName,
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bio: bio ?? this.bio,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'userName': userName,
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'bio': bio,
      'profilePhoto': profilePhoto,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      id: (map["id"] ?? '') as String,
      fullName: (map["fullName"] ?? '') as String,
      userName: (map["userName"] ?? '') as String,
      emailAddress: (map["emailAddress"] ?? '') as String,
      phoneNumber: (map["phoneNumber"] ?? '') as String,
      bio: (map["bio"] ?? '') as String,
      profilePhoto: (map["profilePhoto"] ?? '') as String,
      createdAt: DateTime.parse(map["createdAt"]),
      updatedAt: DateTime.parse(map["updatedAt"]),
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminModel.fromJson(String source) =>
      AdminModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AdminModel(id: $id, fullName: $fullName, userName: $userName, emailAddress: $emailAddress, phoneNumber: $phoneNumber, bio: $bio, profilePhoto: $profilePhoto, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant AdminModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.fullName == fullName &&
        other.userName == userName &&
        other.emailAddress == emailAddress &&
        other.phoneNumber == phoneNumber &&
        other.bio == bio &&
        other.profilePhoto == profilePhoto &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        userName.hashCode ^
        emailAddress.hashCode ^
        phoneNumber.hashCode ^
        bio.hashCode ^
        profilePhoto.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
