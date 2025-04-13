import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/ai_provider.dart';

class AIDesignScreen extends StatelessWidget {
  const AIDesignScreen({super.key});

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      context.read<AIProvider>().generateDesigns(bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    final aiProvider = context.watch<AIProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('AI Design Generator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (aiProvider.inputImage != null)
              Image.memory(aiProvider.inputImage!),

            if (aiProvider.isProcessing)
              const CircularProgressIndicator(),

            if (aiProvider.generatedDesigns.isNotEmpty)
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: aiProvider.generatedDesigns.length,
                  itemBuilder: (context, index) {
                    return Image.memory(
                      base64Decode(aiProvider.generatedDesigns[index]),
                    );
                  },
                ),
              ),

            ElevatedButton(
              onPressed: () => _pickImage(context),
              child: const Text('Upload Room Photo'),
            ),
          ],
        ),
      ),
    );
  }
}
