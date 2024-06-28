import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class MainCamera extends StatefulWidget {
  const MainCamera({Key? key}) : super(key: key);

  @override
  State<MainCamera> createState() => _MainCameraState();
}

class _MainCameraState extends State<MainCamera> {
  late CameraController _cameraController;
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    _requestCameraPermission(); // Request camera permission
  }

  Future<void> _requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      await Permission.camera.request();
    }

    if (status.isPermanentlyDenied) {
      // Handle case where user permanently denied camera permission
      // You may want to show a dialog or guide the user to app settings
      // to enable the permission manually.
    }

    if (status.isGranted) {
      // Camera permission granted, initialize the camera
      initializeCamera();
    }
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    await _cameraController.initialize();
    _openCamera(); // Open the camera directly after initializing
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _cameraController.value.isInitialized
            ? Stack(
          children: [
            CameraPreview(_cameraController),
            _buildScanBoxOverlay(),
          ],
        )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top:25, bottom: 25),
            child: FloatingActionButton(
              onPressed: () {
                _pickImageFromGallery();
              },
              child: Icon(Icons.image,size: 30,),
              backgroundColor: Colors.white,
              //heroTag: 'gallery',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90,right: 90,bottom: 55,top: 55),
            child: FloatingActionButton(
              onPressed: () {
                _captureImage();
              },
              //child: Icon(Icons.camera),
              backgroundColor: Colors.white,
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildScanBoxOverlay() {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
              width: 5.0,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openCamera() async {
    try {
      await _cameraController.initialize();
    } catch (e) {
      print('Error opening camera: $e');
    }
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _captureImage() async {
    try {
      XFile image = await _cameraController.takePicture();
      // Use the captured image (XFile object)
      print('Image captured: ${image.path}');
    } catch (e) {
      print('Error capturing image: $e');
    }
  }

  Future<void> _pickImageFromGallery() async {
    // Implement logic to pick an image from the gallery
    print('Picking image from gallery...');
  }
}
// void main() {
//   runApp(
//     MaterialApp(
//       home: MainCamera(),
//     ),
//   );
// }
