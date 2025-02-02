// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:product_app/Home%20Screen/model/product_response.dart';
import 'package:product_app/Home%20Screen/repository/product_repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:uuid/uuid.dart';

class HomeController extends GetxController {
  late ProductRes res;
  int? index;
  RxList<Product> productList = <Product>[].obs;
  RxList numberOfProduct = [].obs;

  @override
  void onInit() async {
    await getDataMethod();
    super.onInit();
  }

  addProducttoCard(int? id){
    if(numberOfProduct.contains(id) != true){
      numberOfProduct.add(id);
    }

  }
  Future<void> getDataMethod() async {
    try {
      var result = await productRepository.getProductData();
      if(result['result'] == "success"){
        res = ProductRes.fromJson(result);
        productList.value = res.product ?? [];
      }
      print(res);
    } catch (e) {
      print("dhbfbdh$e");
    }
  }
}
