import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartController extends GetxController {
  var isLoading = false.obs;
  var successMessage = ''.obs;
  var errorMessage = ''.obs;
  var cartData = {}.obs;

String base_url = 'https://sanjay-tiwari-backend.vercel.app/api/user/';

  Future<void> addToCart(String productId, String size, int quantity) async {
    isLoading(true);  // Set loading to true
    final url = Uri.parse('${base_url}cart/add'); // Replace with your API URL

    final body = {
      "productId": productId,
      "size": size,
      "quantity": quantity,
      // "wallet": "6523fc49fe28a5cb67c332e5" // Include if needed
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
             // Replace with actual token if needed
        },
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        successMessage.value = data['message'] ?? 'Item added to cart successfully';
      } else {
        errorMessage.value = 'Failed to add to cart: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading(false);  // Set loading to false
    }
  }
  Future<void> getCart() async {
    isLoading(true);  // Start loading
    final url = Uri.parse('${base_url}cart/get'); // Replace with your API URL

    try {
      final response = await http.get(
        url,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        cartData.value = data['data']; // Assign cart data
      } else {
        errorMessage.value = 'Failed to retrieve cart: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading(false);  // Stop loading
    }
  }
  Future<void> updateCart(String productId, String size, int quantity) async {
    isLoading(true);  // Start loading
    final url = Uri.parse('${base_url}cart/update'); // Replace with your API URL

    final body = {
      "productId": productId,
      "size": size,
      "quantity": quantity
    };

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        successMessage.value = data['message'] ?? 'Cart updated successfully';
      } else {
        errorMessage.value = 'Failed to update cart: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading(false);  // Stop loading
    }
  }
  Future<void> deleteCart() async {
    isLoading(true);  // Start loading
    final url = Uri.parse('${base_url}cart/delete'); // API URL

    try {
      final response = await http.delete(
        url,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        successMessage.value = data['message'] ?? 'Cart cleared successfully';
      } else {
        errorMessage.value = 'Failed to clear cart: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading(false);  // Stop loading
    }
  }
  Future<void> updateCartQuantity(String productId, String size, int quantity) async {
    isLoading(true);  // Start loading
    final url = Uri.parse('${base_url}cart/updateQuantity'); // Replace with your API URL

    final body = {
      "productId": productId,
      "size": size,
      "quantity": quantity
    };

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        successMessage.value = data['message'] ?? 'Cart updated successfully';
      } else {
        errorMessage.value = 'Failed to update cart: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading(false);  // Stop loading
    }
  }
  Future<void> deleteCartProductId({required String id}) async {
    isLoading(true);  // Start loading
    final url = Uri.parse('${base_url}cart/products/$id'); // API URL

    try {
      final response = await http.delete(
        url,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        successMessage.value = data['message'] ?? 'Product cleared successfully';
      } else {
        errorMessage.value = 'Failed to clear product: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading(false);  // Stop loading
    }
  }
  Future<void> applyCouponToCart(String couponCode,) async {
    isLoading(true);  // Start loading
    final url = Uri.parse('${base_url}cart/apply-coupon'); // Replace with your API URL

    final body = {
      "couponCode": couponCode,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer YOUR_TOKEN', // Replace with actual token if needed
        },
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        successMessage.value = data['message'] ?? 'Coupon Code apply successfully';
      } else {
        errorMessage.value = 'try other code: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading(false);  // Stop loading
    }
  }
  Future<void> updateCartCoupon(String couponId,) async {
    isLoading(true);  // Start loading
    final url = Uri.parse('${base_url}cart/update-apply-coupon'); // Replace with your API URL

    final body = {
      "couponId": couponId,
    };

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        successMessage.value = data['message'] ?? 'Coupon update successfully';
      } else {
        errorMessage.value = 'try other coupon Number: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading(false);  // Stop loading
    }
  }
  Future<void> removeCartCoupon() async {
    isLoading(true);  // Start loading
    final url = Uri.parse('${base_url}cart/delete-apply-coupon'); // Replace with your API URL

    try {
      final response = await http.delete(
        url,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        successMessage.value = data['message'] ?? 'Coupon remove successfully';
      } else {
        errorMessage.value = 'Something wrong: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading(false);  // Stop loading
    }
  }

}

