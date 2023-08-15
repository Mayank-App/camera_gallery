import 'dart:io';

import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../show_camera_gallery_image_bottomsheet/show_camera_gallery_image_bottomsheet.dart';

class ImagePickerProfile extends StatelessWidget {
  /// This class is used to fetch image using camera and gallery
   ImagePickerProfile({super.key});

  File? selectedImage;

 // Store the selected image here
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ConstantsCameraGallery.imagePathUserProfile != null?
              CircleAvatar(
                radius: 100,
                backgroundImage:  FileImage(ConstantsCameraGallery.imagePathUserProfile!) ,// Use FileImage to convert File to ImageProvider
              ):
          const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage("https://e1.pxfuel.com/desktop-wallpaper/494/437/desktop-wallpaper-bhagwa-flag-jay-shree-ram-bhagwa-dhwaj.jpg")),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 20),
              width: 50,
              decoration: BoxDecoration(
                 color: Color.fromARGB(255, 0, 128, 128),
                  borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                onPressed: () async {
                  // Show the bottom sheet and wait for the result (selected image)
                  File? image = await showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    enableDrag: true,
                    builder: (context) => BottomSheetCameraGallery(),
                  );
                },
                icon: const Icon(Icons.camera_alt_rounded),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
