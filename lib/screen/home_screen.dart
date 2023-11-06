import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:michine_test_webandcraft/screen/employee_details_screen.dart';
import 'package:michine_test_webandcraft/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<HomeProvider>().fetchData();
    //ApiService().getAllEmployees();
    return Scaffold(
      body: SafeArea(
        child: Consumer<HomeProvider>(builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                const Text(
                  "Employees",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  onChanged: (val) {
                    value.filterSearchResults(val);
                  },
                  controller: value.serachController,
                  decoration: const InputDecoration(
                      hintText: "Search..",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20),
                              top: Radius.circular(20)))),
                ),
                SizedBox(
                  height: 20.h,
                ),
                value.isLoading == false
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: ListView.separated(
                            itemBuilder: (ctx, index) {
                              if (value.employeeListItems[index].image ==
                                      null ||
                                  value.employeeListItems[index].image!
                                      .isEmpty) {
                                value.employeeListItems[index].image =
                                    value.image;
                              }
                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EmployeeDetailsScreen(
                                              employeData: value
                                                  .employeeListItems[index],
                                            )),
                                  );
                                },

                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: SizedBox(
                                    height: 45.h,
                                    width: 45.w,
                                    child: Image.network(
                                        value.employeeListItems[index].image!),
                                  ),
                                ),
                                // leading: Container(
                                //   height: 45.h,
                                //   width: 45.w,
                                //   decoration: BoxDecoration(
                                //       shape: BoxShape.circle,
                                //       image: value.employeeListItems[index]
                                //                   .image ==
                                //               null
                                //           ? const DecorationImage(
                                //               image: AssetImage(
                                //                   "asset/image/imagePerson.jpg"),
                                //               fit: BoxFit.cover)
                                //           : DecorationImage(
                                //               image: Image.network(
                                //                   "${value.employeeListItems[index].image}"),
                                //               fit: BoxFit.cover)),
                                // ),
                                title: Text(
                                    value.employeeListItems[index].name ?? ""),
                              );
                            },
                            separatorBuilder: (ctx, index) {
                              return const Divider();
                            },
                            itemCount: value.employeeListItems.length),
                      ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
