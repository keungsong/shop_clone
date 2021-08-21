import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {


  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File _image;
    final picker = ImagePicker();

    
  Future  getImage() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedFile != null){
        _image = File(pickedFile.path);

      }else{

      }
    });
    
       
    }
  @override
  Widget build(BuildContext context) {
    
    return Dialog(
      child:Column(children: [
        AppBar(elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color:Colors.black),
        title: Text('Upload Images',style:TextStyle(color: Colors.black),
        ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children:[
              Container(
                height:120,
                width:MediaQuery.of(context).size.width,
                child:FittedBox(
                                child: _image == null ? Icon(
                    CupertinoIcons.photo_on_rectangle,
                    color:Colors.grey,
                  ): Image.file(_image),
                )
              ),
              Row(
                children: [
                  Expanded(
                                    child: NeumorphicButton(
                                      onPressed: getImage,
                      style: NeumorphicStyle(color: Theme.of(context).primaryColor),
                      child: Text('Select Image',textAlign: TextAlign.center,style: TextStyle(color:Colors.white),),),
                  ),
                ],
              )
            ]
          ),
        )

        
      ],)
    );
  }
}