import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/Home%20Screen/drawer/drawer.dart';
import 'package:product_app/Home%20Screen/home_controller.dart';
import 'package:product_app/product_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final contro = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    //rgba(6, 93, 84, 1) rgba(150, 196, 72, 1)
    return Scaffold(
        // backgroundColor: const Color.fromARGB(255, 150, 196, 72),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          // leading: Icon(
          //   Icons.menu,
          //   color: Colors.white,
          // ),
          backgroundColor: const Color.fromARGB(255, 6, 93, 84),
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: const FrontDrawer(),
        drawerScrimColor: const Color.fromARGB(255, 150, 196, 72),
        body: Column(children: [
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.6,
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: contro.res.product!.length,
                itemBuilder: (context, index) {
                  return Material(
                    //rgba(222, 227, 230, 1)
                    color: const Color.fromARGB(255, 222, 227, 230),
                    borderOnForeground: false,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 1,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 4,
                              // width: MediaQuery.of(context).size.width / 3.5,
                              child: Image.network(
                                  fit: BoxFit.fill,
                                  "${contro.res.product![index].imageUrl}"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${contro.res.product![index].name}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${contro.res.product![index].price}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          contro.index = index;
                                          Get.to(() => ProductScreen());
                                        },
                                        child: const Row(
                                          children: [
                                            Text(
                                              "View More",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 150, 196, 72)),
                                            ),
                                            Icon(
                                              Icons.forward,
                                              size: 15,
                                              color: Color.fromARGB(
                                                  255, 150, 196, 72),
                                            )
                                          ],
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ]),
                  );
                }),
          ),
        ]));
  }
}
