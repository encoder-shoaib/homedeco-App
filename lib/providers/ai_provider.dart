import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIProvider with ChangeNotifier {
  Uint8List? inputImage;
  bool isProcessing = false;
  List<String> generatedDesigns = [];

  // Simulated mock API response
  Future<void> generateDesigns(Uint8List imageBytes) async {
    inputImage = imageBytes;
    isProcessing = true;
    generatedDesigns = [];
    notifyListeners();

    try {
      // Simulating a delay like an actual API call
      await Future.delayed(const Duration(seconds: 2));

      // Mock data simulating generated designs
      generatedDesigns = [
        'https://via.placeholder.com/150?text=Design+1',
        'https://via.placeholder.com/150?text=Design+2',
        'https://via.placeholder.com/150?text=Design+3',
      ];

      debugPrint("✅ Mock Response: $generatedDesigns");
    } catch (e) {
      debugPrint("🔥 Exception occurred: $e");
    } finally {
      isProcessing = false;
      notifyListeners();
    }
  }
}
