import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocketdermtest/components/roundedbutton.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:uuid/uuid.dart';

class UploadScreen extends StatefulWidget {
  static const String id = 'upload_screen';
  const UploadScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  var uuid = Uuid();
  dynamic imageFile;
  dynamic tobeUploadedFile;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    setState(
      () {
        imageFile = pickedFile!;
        tobeUploadedFile = File(imageFile.path);
      },
    );
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(
      () {
        imageFile = pickedFile!;
        tobeUploadedFile = File(imageFile.path);
      },
    );
  }

  Future uploadImageToFirebase() async {
    firebase_storage.Reference storageReference =
        firebase_storage.FirebaseStorage.instance.ref('Image Storage').child(
              uuid.v1(),
            );
    await storageReference.putFile(tobeUploadedFile);
    String downloadURL = await storageReference.getDownloadURL();
    print(downloadURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.image,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Upload Image',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100.0),
                  bottomRight: Radius.circular(100.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: const BorderSide(
                    width: 1.0,
                    color: Colors.black45,
                  ),
                ),
                child: (imageFile == null)
                    ? const Center(
                        child: Text(
                          'Choose An Image',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black54,
                          ),
                        ),
                      )
                    : Image.file(
                        tobeUploadedFile,
                      ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40.0,
                bottom: 40.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _openCamera(context);
                        },
                        child: const Text(
                          'Camera',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _openGallery(context);
                        },
                        child: const Text(
                          'Gallery',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 64.0,
                right: 64.0,
                bottom: 64.0,
              ),
              child: RoundedButton(
                  onPressed: () {
                    if (tobeUploadedFile != null) {
                      uploadImageToFirebase();
                    } else {
                      print('null image');
                    }
                  },
                  displayText: 'Submit',
                  color: Colors.purple.shade900),
            ),
          ),
        ],
      ),
    );
  }
}
