// class LoginModel {
//   int code;
//   String message;
//   Data data;
//   String token;

//   LoginModel({
//     required this.code,
//     required this.message,
//     required this.data,
//     required this.token,
//   });

//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//         code: json["code"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//         token: json["token"],
//       );

//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "message": message,
//         "data": data.toJson(),
//         "token": token,
//       };
// }

// class Data {
//   int id;
//   int roleId;
//   String name;
//   String email;
//   dynamic emailVerifiedAt;
//   String mobile;
//   dynamic profileImage;
//   dynamic location;
//   dynamic latitude;
//   dynamic longitude;
//   String status;
//   int isActive;
//   int createdBy;
//   int updatedBy;
//   DateTime createdAt;
//   DateTime updatedAt;

//   Data({
//     required this.id,
//     required this.roleId,
//     required this.name,
//     required this.email,
//     required this.emailVerifiedAt,
//     required this.mobile,
//     required this.profileImage,
//     required this.location,
//     required this.latitude,
//     required this.longitude,
//     required this.status,
//     required this.isActive,
//     required this.createdBy,
//     required this.updatedBy,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         roleId: json["role_id"],
//         name: json["name"],
//         email: json["email"],
//         emailVerifiedAt: json["email_verified_at"],
//         mobile: json["mobile"],
//         profileImage: json["profile_image"],
//         location: json["location"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         status: json["status"],
//         isActive: json["is_active"],
//         createdBy: json["created_by"],
//         updatedBy: json["updated_by"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "role_id": roleId,
//         "name": name,
//         "email": email,
//         "email_verified_at": emailVerifiedAt,
//         "mobile": mobile,
//         "profile_image": profileImage,
//         "location": location,
//         "latitude": latitude,
//         "longitude": longitude,
//         "status": status,
//         "is_active": isActive,
//         "created_by": createdBy,
//         "updated_by": updatedBy,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
