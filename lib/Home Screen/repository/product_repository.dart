import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class ProductRepository {
// var http = http.Client();
  Future<dynamic> getProductData() async {
    //https://api.npoint.io/44baf1cec4126a8046b6 https://api.npoint.io/b9ae3c7ef937645a5a76
    var jsonResponse;
    var result =
        await http.get(Uri.parse("https://api.npoint.io/44baf1cec4126a8046b6"));
    if (result.statusCode == 200) {
      jsonResponse = convert.jsonDecode(result.body);
      print(jsonResponse);
    }
    return jsonResponse;
  }
}

var productRepository = ProductRepository();
