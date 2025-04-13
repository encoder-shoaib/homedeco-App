import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  final Uint8List? imageBytes;
  final VoidCallback onImagePicked;
  final VoidCallback onImageRemoved;

  const ImagePickerWidget({
    super.key,
    required this.imageBytes,
    required this.onImagePicked,
    required this.onImageRemoved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upload Room Image (Optional)',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onImagePicked,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: imageBytes != null
                ? Stack(
                    children: [
                      Image.memory(imageBytes!, fit: BoxFit.cover),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: onImageRemoved,
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt, size: 40),
                        SizedBox(height: 8),
                        Text('Tap to upload image'),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}