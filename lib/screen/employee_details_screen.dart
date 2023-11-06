import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:michine_test_webandcraft/model/employes_model.dart';
import 'package:michine_test_webandcraft/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final EmployeesModel employeData;
  const EmployeeDetailsScreen({super.key, required this.employeData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Consumer<HomeProvider>(builder: (context, value, child) {
          return Column(
            children: [
              Container(
                height: 280.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(employeData.image!, scale: 1.0),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          size: ScreenUtil().setSp(32),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  children: [
                    employeeDetail("Full Name", employeData.name ?? ""),
                    employeeDetail("Email", employeData.email ?? ""),
                    employeeDetail(
                        "Designation", employeData.designation ?? ""),
                    employeeDetail("Department", employeData.department ?? "")
                  ],
                ),
              )
            ],
          );
        })),
      ),
    );
  }

// details show widget
  Widget employeeDetail(String name, String detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 102, 91, 91)),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          detail,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Divider(
          color: Colors.black,
          height: 30.h,
        )
      ],
    );
  }
}
