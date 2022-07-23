import 'dart:convert';
import 'package:http/http.dart';

Future<String> Post(String a, String b, String c, String d, String e, String f,
    String g, String h) async {
  final String apiUrl = "https://predicthor.herokuapp.com/predict/";
  try {
    final response = await post(Uri.parse(apiUrl), body: {
      "product_name": a,
      "purchase_units": b,
      "purchase_price": c,
      "total_purchase": d,
      "sales_units": e,
      "sales_price": f,
      "total_sales": g,
      "profit": h,
    });
    var output = response.body as String;
    print(output.substring(10, output.length - 1));
    print(response.body);
    return output.substring(10, output.length - 1);
  } catch (e) {
    print(e);
    return "Error";
  }
}
