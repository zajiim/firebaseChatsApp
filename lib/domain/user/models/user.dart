class UserModel {
  final String name;
  final String uid;
  final String profilePic;
  final bool isOnline;
  final String phoneNumber;
  final List<String> groupId;

  UserModel({
    required this.name,
    required this.uid,
    required this.profilePic,
    required this.isOnline,
    required this.phoneNumber,
    required this.groupId,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'profilePic': profilePic,
      'isOnline': isOnline,
      'phoneNumber': phoneNumber,
      'groupId': groupId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? "",
      uid: map['uid'] ?? "",
      profilePic: map['profilePic'] ?? "",
      isOnline: map['isOnline'] ?? "",
      phoneNumber: map['phoneNumber'] ?? "",
      groupId: List<String>.from(
        map['groupId'],
      ),
    );
  }
}

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'user.freezed.dart';
// part 'user.g.dart';

// @freezed
// class UserModel with _$UserModel {
//   const factory UserModel({
//     required final String? name,
//     required final String? uid,
//     required final String? profilePic,
//     required final String? phoneNumber,
//     required final bool isOnline,
//     required final List<String>? groupId,
//   }) = _UserModel;

//   factory UserModel.fromJson(Map<String, dynamic> json) =>
//       _$UserModelFromJson(json);
// }
