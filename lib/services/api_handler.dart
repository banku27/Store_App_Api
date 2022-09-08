import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_api_app/models/product_model.dart';

class ApiHandler {
  // https://api.escuelajs.co/api/v1/products

  Future<List<ProductsModel>> getAllProducts() async {
    var uri = Uri.https(
      'api.escuelajs.co',
      'api/v1/products',
    );
    var response = await http.get(uri);
    var data = jsonDecode(response.body);

    List tempList = [];
    for (var v in data) {
      tempList.add(v);
    }
    return ProductsModel.productsFromSnapshot(tempList);
    // or
    // var response = await http.get(
    //   Uri.parse(
    //     'https://api.escuelajs.co/api/v1/products',
    //   ),
    // );
    // print('response ${jsonDecode(response.body)}');
  }
}
