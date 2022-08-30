import 'package:flutter/material.dart';

class EmployeeDetails extends StatelessWidget {
  const EmployeeDetails(
      {Key? key,
      required this.email,
      required this.address,
      required this.image,
      required this.phone,
      required this.username})
      : super(key: key);
  final email;
  final address;
  final image;
  final phone;
  final username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 150,
          child: Row(
            children: [
              Image.network(image),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 220,
                    child: Text(
                      'Phone number: $phone',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'User name:$username',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 230,
                    child: Text(
                      ' Email:$email',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Address:$address',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
