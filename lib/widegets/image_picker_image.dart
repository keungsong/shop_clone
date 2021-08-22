import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:provider/provider.dart';
import 'package:shop_clone/provider/cat_provider.dart';

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File _image;
  final picker = ImagePicker();
  bool _uploading = false;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<CategoryProvider>(context);
    Future<String> uploadFile() async {
      File file = File(_image.path);

      String imageName =
          'productImage/${DateTime.now().microsecondsSinceEpoch}';
      String downloadUrl;
      try {
        await FirebaseStorage.instance.ref(imageName).putFile(file);
        downloadUrl =
            await FirebaseStorage.instance.ref(imageName).getDownloadURL();
        if (downloadUrl != null) {
          setState(() {
            _image = null;
            _provider.getImages(downloadUrl);
          });
        }
      } on FirebaseException catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Canceled')));
      }
      return downloadUrl;
    }

    return Dialog(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Upload Images',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Stack(
              children: [
                if (_image != null)
                  Positioned(
                      right: 0,
                      child: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _image = null;
                            });
                          })),
                Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      child: _image == null
                          ? Icon(
                              CupertinoIcons.photo_on_rectangle,
                              color: Colors.grey,
                            )
                          : Image.file(_image),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            if (_provider.listOfUrls.length > 0)
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4)),
                child: GalleryImage(
                  imageUrls: _provider.listOfUrls,
                ),
              ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: NeumorphicButton(
                    onPressed: getImage,
                    style:
                        NeumorphicStyle(color: Theme.of(context).primaryColor),
                    child: Text(
                      _provider.listOfUrls.length > 0
                          ? 'Add more image'
                          : 'Add Image',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            if (_image != null)
              Row(
                children: [
                  Expanded(
                    child: NeumorphicButton(
                      onPressed: () {
                        setState(() {
                          _uploading = true;
                          uploadFile().then((url) {
                            if (url != null) {
                              setState(() {
                                _uploading = false;
                              });
                            }
                          });
                        });
                      },
                      style: NeumorphicStyle(color: Colors.grey),
                      child: Text(
                        'Save',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: NeumorphicButton(
                      onPressed: () {},
                      style: NeumorphicStyle(color: Colors.grey),
                      child: Text(
                        'Cancel',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            SizedBox(
              height: 20,
            ),
            if (_uploading)
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              )
          ]),
        )
      ],
    ));
  }
}
