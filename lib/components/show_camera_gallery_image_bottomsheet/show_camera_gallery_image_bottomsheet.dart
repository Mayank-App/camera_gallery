import 'dart:io';
import 'package:camera_gallery_assignment/utils/route_name/route_name.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../constants/constants.dart';


class BottomSheetCameraGallery extends StatelessWidget {
  BottomSheetCameraGallery({super.key});
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 250,
      width: wi,
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 20, right: 20),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                    child: Text(
                      "Profile Photo",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                )),
                Icon(
                  Icons.delete,
                  color: Colors.grey,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.only(left: 8),
                  child :InkWell(
                    onTap: () {
                      requestPermission(context, ImageSource.camera);
                      // debugPrint("Clicked on Camera Picker");
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.grey, width: 2)),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color:Color.fromARGB(255, 0, 128, 128),
                          ),
                        ),
                        SizedBox(height: 5,),
                        const Text(
                          "Camera",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  ),
                  InkWell(
                    onTap: (){
                      requestPermission(context, ImageSource.gallery);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.grey, width: 2)),
                          child: const Icon(
                            Icons.image,
                           color: Color.fromARGB(255, 0, 128, 128),
                          ),
                        ),
                        SizedBox(height: 5,),
                        const Text(
                          "Gallery",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                 Padding(padding: EdgeInsets.only(right: 10), child : InkWell(
                    onTap: (){},
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.grey, width: 2)),
                          child: const Icon(
                            Icons.insert_emoticon,
                            color: Color.fromARGB(255, 0, 128, 128),
                          ),
                        ),
                        SizedBox(height: 5,),
                        const Text(
                          "Avatar",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                 )
                ],
              ),
            
          ],
        ),
      ),
    );
  }

  fetchImage(ImageSource source, BuildContext context) async {
    try
    {
      XFile? pickImage = await ImagePicker()
          .pickImage(source: source, maxHeight: 200, maxWidth: 300);
      if (pickImage == null) return;
      final tmpImage = File(pickImage.path);
      ConstantsCameraGallery.imagePathUserProfile = tmpImage;
      Navigator.pushNamedAndRemoveUntil(context, RouteName.PROFILE_EDIT_PAGE, (routes)=>false);
      // Navigator.pop(context);
    }
    on Exception catch (_)
    {

    }
  }
  Future<void> requestPermission(context, source) async {
    // Request the desired permission
    PermissionStatus status = await Permission.camera.request();

    // Check the permission status
    if (status.isGranted) {
      // Permission granted, you can proceed with your logic
      fetchImage(source, context);
    } else {
      // Permission denied, show an explanation and optionally a button to open app settings
      openAppSettings();
      Navigator.of(context).pop();
    }
  }
}
