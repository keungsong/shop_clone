import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:provider/provider.dart';
import 'package:shop_clone/provider/cat_provider.dart';
import 'package:shop_clone/widegets/image_picker_image.dart';

class SellerFormScreen extends StatefulWidget {
  static const String id = 'seller-form';

  @override
  _SellerFormScreenState createState() => _SellerFormScreenState();
}

class _SellerFormScreenState extends State<SellerFormScreen> {
  final _formKey = GlobalKey<FormState>();

  var _productName = TextEditingController();

  var _bandModel = TextEditingController();
  var _price = TextEditingController();

  var _description = TextEditingController();

  validate(CategoryProvider provider) {
    if (_formKey.currentState.validate()) {
      if (provider.listOfUrls.isEmpty) {
        provider.dataToFireStore.addAll({
          'productName': _productName.text,
          'productModel': _bandModel.text,
          'productDescription': _description.text,
          'productPrice': _price.text,
          'productImage': [provider.listOfUrls]
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Image not upload'),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please complete required field...'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var _catProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Add Details', style: TextStyle(color: Colors.black)),
        shape: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Information'),
                    TextFormField(
                      controller: _productName,
                      decoration: InputDecoration(labelText: 'product name*'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please complete required field';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _bandModel,
                      decoration: InputDecoration(labelText: 'Brand/Model*'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please complete required field';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _price,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Price*'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please complete required field';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _description,
                      maxLength: 4000,
                      minLines: 1,
                      maxLines: 20,
                      decoration: InputDecoration(labelText: 'Description*'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please complete required field';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4)),
                      child: _catProvider.listOfUrls.length == 0
                          ? Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'No Image Selected',
                                textAlign: TextAlign.center,
                              ),
                            )
                          : GalleryImage(
                              imageUrls: _catProvider.listOfUrls,
                            ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ImagePickerWidget();
                            });
                      },
                      child: Neumorphic(
                          child: Container(
                        height: 40,
                        child: Center(
                            child: Text(_catProvider.listOfUrls.length > 0
                                ? 'Upload More Images'
                                : 'UploadImage')),
                      )),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            )),
      ),
      bottomSheet: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: NeumorphicButton(
                style: NeumorphicStyle(color: Theme.of(context).primaryColor),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Save',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  validate(_catProvider);
                  print(_catProvider.dataToFireStore);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
