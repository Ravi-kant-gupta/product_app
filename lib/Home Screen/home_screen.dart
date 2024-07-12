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
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Icon(Icons.shopping_cart,size: 30,),
                  Positioned(left: 0,top: 0,
                      child: CircleAvatar(
                        backgroundColor:Colors.green,
                        radius: 8,
                        child: Obx(
                          () {
                            return Text("${contro.numberOfProduct.length}",
                              style: TextStyle(fontSize: 10,color:Colors.white),);
                          }
                        ),))
                ],
              ),
            )
          ],
        ),
        drawer: const FrontDrawer(),
        drawerScrimColor: const Color.fromARGB(255, 6, 93, 84),
        // const Color.fromARGB(255, 150, 196, 72),
        body: RefreshIndicator(
          color:const Color.fromARGB(255, 6, 93, 84),
          onRefresh: () async{
            await contro.getDataMethod();
          },
          child: Column(children: [
            // const SizedBox(
            //   height: 5,
            // ),
            Obx(
              () {
                if(contro.productList.isEmpty){
                  return const Center(child: CircularProgressIndicator(),);
                }else{
          
                return Expanded(
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        childAspectRatio: 0.5,
                        maxCrossAxisExtent: 300,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 0.0,
                      ),
                      itemCount: contro.res.product!.length,
                      itemBuilder: (context, index) {
                        return Container(margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Material(
                            //rgba(222, 227, 230, 1)
                            color: const Color.fromARGB(255, 222, 227, 230),
                            borderOnForeground: false,
                            borderRadius: BorderRadius.circular(10),
                            elevation: 1,
                            child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        height: MediaQuery.of(context).size.height / 4.5,
                                        // width: MediaQuery.of(context).size.width / 3.5,
                                        child: Image.network(
                                            fit: BoxFit.fill,
                                            "${contro.res.product![index].imageUrl}"),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${contro.res.product![index].name}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                  "Price ${contro.res.product![index].price}",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: const TextStyle(),
                                                ),
                                            Container(margin: EdgeInsets.symmetric(horizontal:10),
                                              padding: EdgeInsets.symmetric(horizontal:10),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Color.fromARGB(255, 150, 196, 72)
                                              ),
                                              child:
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                Text("${contro.res.product![index].rating}/5"),
                                                Icon(Icons.star,size: 15,)
                                              ],)

                                  ),

                                          ],
                                        ),
                                        // Spacer(),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(child: TextButton(

                                                    style: TextButton.styleFrom(
                                                        visualDensity: VisualDensity.compact,
                                                        backgroundColor: const Color.fromARGB(255, 6, 93, 84),
                                                        // side: BorderSide(color: Color.fromARGB(
                                                        //     255, 150, 196, 72))
                                                    ),
                                                    onPressed: (){
                                                      contro.addProducttoCard(contro.productList[index].id);
                                                    },
                                                    child: Text("Add to Cart",
                                                      style: TextStyle(fontSize: 13,color: Colors.white),))),
                                              ],
                                            ),
                                            Row(
                                              children: [

                                                Expanded(
                                                  child: TextButton(
                                                      style: TextButton.styleFrom(
                                                          visualDensity: VisualDensity.compact,
                                                          // backgroundColor: Colors.green
                                                          side: BorderSide(color: Color.fromARGB(
                                                              255, 150, 196, 72))
                                                      ),
                                                      onPressed: () {
                                                        contro.index = index;
                                                        Get.to(() => ProductScreen());
                                                      },
                                                      child: const Row(mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            "View More",
                                                            style: TextStyle(fontSize: 13,
                                                                color: const Color.fromARGB(255, 6, 93, 84)
                                                              // Color.fromARGB(
                                                              //     255, 150, 196, 72)
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.forward,
                                                            size: 15,
                                                            color: const Color.fromARGB(255, 6, 93, 84),
                                                            // Color.fromARGB(
                                                            //     255, 150, 196, 72),
                                                          )
                                                        ],
                                                      )),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                  // const SizedBox(
                                  //   height: 5,
                                  // )
                                ]),
                          ),
                        );
                      }),
                );
                }
              }
            ),
          ]),
        ));
  }
}
