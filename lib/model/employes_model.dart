// To parse this JSON data, do
//
//     final employeesModel = employeesModelFromJson(jsonString);

import 'dart:convert';

List<EmployeesModel> employeesModelFromJson(String str) => List<EmployeesModel>.from(json.decode(str).map((x) => EmployeesModel.fromJson(x)));

String employeesModelToJson(List<EmployeesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeesModel {
    DateTime? createdAt;
    String? name;
    String? image;
    String? designation;
    String? department;
    String? email;
    String? id;

    EmployeesModel({
         this.createdAt,
         this.name,
         this.image,
         this.designation,
         this.department,
         this.email,
         this.id,
    });

    factory EmployeesModel.fromJson(Map<String, dynamic> json) => EmployeesModel(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        image: json["image"],
        designation: json["designation"],
        department: json["department"],
        email: json["email"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "name": name,
        "image": image,
        "designation": designation,
        "department": department,
        "email": email,
        "id": id,
    };
}
