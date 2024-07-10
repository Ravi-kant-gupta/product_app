import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/Home%20Screen/home_controller.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  final contro = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 6, 93, 84),
        title: const Text(
          "Product Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: InteractiveViewer(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Image.network(
                                fit: BoxFit.fill,
                                "${contro.res.product![contro.index ?? 0].imageUrl}"),
                          ),
                        ),
                      );
                    });
              },
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Image.network(
                        fit: BoxFit.fill,
                        "${contro.res.product![contro.index ?? 0].imageUrl}"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
