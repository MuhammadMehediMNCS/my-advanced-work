import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class GalleryOrCamera extends StatelessWidget {
  const GalleryOrCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImagePickDesign(),
    );
  }
}

class ImagePickDesign extends StatefulWidget {
  const ImagePickDesign({super.key});

  @override
  State<ImagePickDesign> createState() => _ImagePickDesignState();
}

class _ImagePickDesignState extends State<ImagePickDesign> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if(image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade300,
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Spacer(),
            image != null 
              ? Image.file(
                image!,
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              )
              : const FlutterLogo(size: 60),
            const SizedBox(height: 24),
            const Text(
              'Image Picker',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 48),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 40)
              ),
              icon: const Icon(Icons.image),
              label: const Text('Pick Gallery'),
              onPressed: () => pickImage(ImageSource.gallery)
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 40)
              ),
              icon: const Icon(Icons.camera_enhance),
              label: const Text('Pick Camera'),
              onPressed: () => pickImage(ImageSource.camera)
            )
          ],
        ),
      ),
    );
  }
}