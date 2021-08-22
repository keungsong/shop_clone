import 'package:flutter/cupertino.dart';

class CategoryProvider with ChangeNotifier {
  List<String> listOfUrls = [];

  Map<String, dynamic> dataToFireStore = {};

  getImages(url) {
    this.listOfUrls.add(url);
    notifyListeners();
  }

  getData(data) {
    this.dataToFireStore = data;
    notifyListeners();
  }
}
