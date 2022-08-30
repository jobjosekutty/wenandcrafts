import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webandcrafts/view/employee_details.dart';

import '../controller/homecontroller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController controller = Get.put(HomeController());

  Widget customSearchBar = const Text('My Personal Journal');
  TextEditingController searchvalue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('WebandCrafts'),
          centerTitle: true,
        ),
        body: GetBuilder<HomeController>(
          builder: ((controller) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextField(
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.search),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'search')),
                const SizedBox(
                  height: 20,
                ),
                controller.load
                    ? CircularProgressIndicator()
                    : Expanded(
                        child: GetBuilder<HomeController>(
                          builder: ((controller) {
                            return SizedBox(
                              height: 800,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller.employeeList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(() => EmployeeDetails(
                                            email: controller
                                                .employeeList[index].email,
                                            address: controller
                                                .employeeList[index]
                                                .address
                                                ?.street,
                                            image: controller
                                                .employeeList[index]
                                                .profileImage,
                                            phone: controller
                                                .employeeList[index].phone,
                                            username: controller
                                                .employeeList[index].username));
                                      },
                                      child: Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          margin: const EdgeInsets.only(
                                              right: 10,
                                              left: 10,
                                              top: 5,
                                              bottom: 5),
                                          child: Row(
                                            children: [
                                              Image.network(controller
                                                  .employeeList[index]
                                                  .profileImage
                                                  .toString()),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Name:${controller.employeeList[index].name}',
                                                  ),
                                                  Text(controller
                                                      .employeeList[index]
                                                      .address!
                                                      .street
                                                      .toString()),
                                                ],
                                              )
                                            ],
                                          )
                                          //  Center(
                                          //     child:
                                          // Text(controller
                                          //         .employeeList[index].name
                                          //         .toString())),
                                          ),
                                    );
                                  }),
                            );
                          }),
                        ),
                      )
              ],
            );
          }),
        ));
  }
}
