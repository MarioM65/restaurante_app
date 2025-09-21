import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/order.dart';
import '../models/reservation.dart';
import '../models/payment.dart';
import '../models/create_user_dto.dart';
import './auth_service.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000/api'; // Assuming API runs on localhost:3000
  final AuthService _authService = AuthService();

  Future<Map<String, String>> _getHeaders({bool requireAuth = true}) async {
    if (!requireAuth) {
      return {'Content-Type': 'application/json'};
    }
    final token = await _authService.getToken();
    if (token == null) {
      throw Exception('Authentication token not found.');
    }
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // Method for user login
  Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: await _getHeaders(requireAuth: false),
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['access_token'];
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  // Method for user registration
  Future<User> register(CreateUserDto user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: await _getHeaders(requireAuth: false),
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register: ${response.body}');
    }
  }

  // Method for user logout
  Future<void> logout() async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/logout'),
      headers: await _getHeaders(),
    );

    if (response.statusCode == 200) {
      print('Logged out successfully!');
    } else {
      throw Exception('Failed to logout: ${response.body}');
    }
  }

  // Method to get user profile
  Future<User> getUserProfile() async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/me'), // Updated endpoint
      headers: await _getHeaders(),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user profile');
    }
  }

  // Method to get all categories
  Future<List<Category>> getCategories() async {
    final response = await http.get(
      Uri.parse('$baseUrl/categories'),
      headers: await _getHeaders(),
    );

    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      return list.map((model) => Category.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  // Method to get all products
  Future<List<Product>> getProducts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/products'),
      headers: await _getHeaders(),
    );

    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      return list.map((model) => Product.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Method to get all orders
  Future<List<Order>> getOrders() async {
    final response = await http.get(
      Uri.parse('$baseUrl/orders'),
      headers: await _getHeaders(),
    );

    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      return list.map((model) => Order.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }

  // Method to create a reservation (hypothetical endpoint)
  Future<void> createReservation(Reservation reservation) async {
    final response = await http.post(
      Uri.parse('$baseUrl/reservations'), // Hypothetical endpoint
      headers: await _getHeaders(),
      body: jsonEncode(reservation.toJson()),
    );

    if (response.statusCode == 201) { // Assuming 201 Created for success
      print('Reservation created successfully!');
    } else {
      throw Exception('Failed to create reservation: ${response.body}');
    }
  }

  // Method to create a payment
  Future<void> createPayment(Payment payment) async {
    final response = await http.post(
      Uri.parse('$baseUrl/payments'),
      headers: await _getHeaders(),
      body: jsonEncode(payment.toJson()),
    );

    if (response.statusCode == 201) { // Assuming 201 Created for success
      print('Payment created successfully!');
    } else {
      throw Exception('Failed to create payment: ${response.body}');
    }
  }
}