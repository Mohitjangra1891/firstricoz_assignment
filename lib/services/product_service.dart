import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';


class ProductService {
  // Future<List<Product>> fetchProducts_from_api() async {
  //   return [
  //     Product(
  //       id: '1',
  //       title: 'Essence Mascara Lash Princess',
  //       brand: 'Essence',
  //       price: 9.99,
  //       discountPercentage: 7.17,
  //       rating: 4.94,
  //       imageUrl: ['https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png'], description: '', thumbnail: '',
  //     ),
  //     // Add more products here
  //   ];
  // }
  Future<List<Product>> fetchProducts() async {
    print("fetching products"); // Check the number of products

    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    print("response.statusCode =${response.statusCode}"); // Check the number of products

    if (response.statusCode == 200) {
      print(" response.body is"+response.body); // Print the entire response
      var data = jsonDecode(response.body);
      print("\nData: $data");
      // final jsonResponse = json.decode(response.body);
      // print("josin respornse is"+jsonResponse); // Print the entire response
      final List<dynamic> productList = data['products'];
      print("\nproductList: $productList");

      print("\nproduxt length"+productList.length.toString()); // Check the number of products
      // var  list;
      try {
        final list = productList.map((json) => Product.fromJson(json)).toList();
        print("\nlist is $list");
        return list;
      } catch (e, stacktrace) {
        print("Exception: $e");
        print("Stacktrace: $stacktrace");
        return [];
      }

    } else {
      print("Failed to load products products"); // Check the number of products

      throw Exception('Failed to load products');
    }
  }
}
