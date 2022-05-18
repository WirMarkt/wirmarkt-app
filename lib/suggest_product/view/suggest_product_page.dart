import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import 'review_product_suggestion_page.dart';

class SuggestProductPage extends StatefulWidget {
  const SuggestProductPage({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SuggestProductPage());
  }

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

    if (cameras.isEmpty) {
      return Future.error("No cameras found");
    } else {
      final firstCamera = cameras.first;

      // To display the current output from the Camera,
      // create a CameraController.
      _controller = CameraController(
        // Get a specific camera from the list of available cameras.
        firstCamera,
        // Define the resolution to use.
        ResolutionPreset.medium,
        //disable audio
        enableAudio: false,
      );

      // Next, initialize the controller. This returns a Future.
      return _controller.initialize();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        Widget? body;
        Widget? actionButton;

        if (snapshot.error != null) {
          body = _CameraFailureNotice();
        } else if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          body = CameraPreview(
            _controller,
            child: _CameraPreviewInstructions(),
          );

          actionButton = FloatingActionButton(
            // Provide an onPressed callback.
            onPressed: _floatingButtonPressed,
            child: const Icon(Icons.camera_alt),
          );
        } else {
          // Otherwise, display a loading indicator.
          body = const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(title: Text(S.of(context).suggestProduct)),
          body: body,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: actionButton,
        );
      },
    );
  }

  void _floatingButtonPressed() async {
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
  }
}

class _CameraPreviewInstructions extends StatelessWidget {
  const _CameraPreviewInstructions();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        S.of(context).suggestProductInstructionText,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _CameraFailureNotice extends StatelessWidget {
  const _CameraFailureNotice();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          S.of(context).failedToInitializeCamera,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
