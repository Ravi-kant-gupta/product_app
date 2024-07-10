import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FrontDrawer extends StatelessWidget {
  const FrontDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: ListView(
            children: [
              ListTile(
                onTap: () {
                  Get.back();
                },
                title: Text("Home"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
