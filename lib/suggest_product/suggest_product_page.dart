import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

//TODO create step-by-step UI to submit a product suggestion
class SuggestProductPage extends StatefulWidget {
  final String title;

  final String instructionsText;

  const SuggestProductPage({
    Key? key,
    required this.title,
    required this.instructionsText,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SuggestProductPageState();
  }
}

class SuggestProductPageState extends State<SuggestProductPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    _initializeControllerFuture = initCamera();

    super.initState();
  }

  Future<void> initCamera() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.

    //TODO this might be empty, deal with that in UI!
    final firstCamera = cameras.first;

    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      firstCamera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    return _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(
              _controller,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.instructionsText,
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ReviewProductSuggestionPage(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // TODO handle error
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

class ReviewProductSuggestionPage extends StatelessWidget {
  final String imagePath;

  const ReviewProductSuggestionPage({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vorschlag absenden?")),
      body: Column(
        children: [
          Image(image: FileImage(File(imagePath))),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
              child: const Text("Absenden"))
        ],
      ),
    );
  }
}
