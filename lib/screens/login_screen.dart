import 'package:flutter/material.dart';
import 'package:shop_clone/widegets/auth_ui.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset('assets/images/logo.png'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'ຊື້-ຂາຍ ອອນລາຍ',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: AuthUi(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ຖ້າທ່ານຍອມຮັບດຳເນີນຕໍ່\n ເງື່ອນໄຂ ແລະ ນະໂຍບາຍຄວາມເປັນສ່ວນຕົວ',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
