import 'dart:convert';

import 'package:http/http.dart' as http;
import 'item_model.dart';

class HomeRepository {
  Future<List<ItemModel>> fetchItems() async {
    try {
      final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
      final data = jsonDecode(response.body) as List;
      print('API Data: $data');
      return data.map((item) => ItemModel.fromJson(item)).toList();
    } catch (e) {
      print('Error in fetchItems: $e');
      throw Exception('Failed to fetch data');
    }
  }
}
