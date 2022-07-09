import 'package:dio/dio.dart';

import 'api_links.dart';

class ApiServices {

  Future getListProductCart(int customerId) async {
    var map = {'customerId': customerId};
    final response = await Dio().post(ApiLinks.getAccessToken, data: map);
    // final List data = response.content['list'];
    return response;
  }

  // Future updateCart(int customerId, int productId, int? quantity, int type) async {
  //   var map = quantity != null
  //       ? {'customerId': customerId, 'productId': productId, 'quantity': quantity, 'type': type}
  //       : {'customerId': customerId, 'productId': productId, 'type': type};
  //   final response = await post(ApiPaths.updateCart, map);
  //   return response;
  // }
  //
  // Future<String> getPhoneCskh() async {
  //   final responseJson = await get(ApiPaths.phoneCskh);
  //   return responseJson.content['phoneCS'] ?? "";
  // }
  //
  // Future getCalculatePromotion(List<Product> products) async {
  //   final lstProduct = products.map((e) => {
  //     'productId': e.productId,
  //     'quantity': e.quantity,
  //   }).toList();
  //   final response = await post(ApiPaths.calculatePromotion, lstProduct);
  //   return response;
  // }
  //
  // Future saveOrder(ListSaveCartRequest listSaveCartRequest) async {
  //
  //   final response = await post(ApiPaths.saveOrder, listSaveCartRequest.toJson());
  //   return response;
  // }
  //
  // Future reBuyOrder(int orderId) async{
  //   var map = {'orderId': orderId};
  //   final response = await post(ApiPaths.reBuyOrder, map);
  //   return response;
  // }
}