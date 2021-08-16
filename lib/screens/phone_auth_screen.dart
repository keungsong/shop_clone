import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_clone/services/phone_auth_service.dart';
import 'package:legacy_progress_dialog/legacy_progress_dialog.dart';

class PhoneAuthScreen extends StatefulWidget {
  static const String id = 'phone-auth-screen';

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  var countryCodeController = TextEditingController(text: '+85620');
  var phoneNumberController = TextEditingController();
  bool validate = false;

  PhoneAuthServices _services = PhoneAuthServices();

  phoneAuthentication(number) {
    // need to do authentication here
  }

  @override
  Widget build(BuildContext context) {
    //  create an instance of progressDialog
    ProgressDialog progressDialog = ProgressDialog(
      context: context,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      loadingText: 'ກະລຸນາ ລໍຖ້າ...',
      progressIndicatorColor: Theme.of(context).primaryColor,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Icon(
              Icons.phone_android,
              color: Colors.red,
              size: 60,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'ປ້ອນເບີໂທລະສັບ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'ພວກເຮົາຈະສົ່ງລະຫັດການຢືນຢັນໄປຫາເບີຂອງທ່ານ',
              style: TextStyle(color: Colors.grey),
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: countryCodeController,
                      enabled: false,
                      decoration: InputDecoration(
                          counterText: '00', labelText: 'ລະຫັດປະເທດ'),
                    )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 3,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 8) {
                          setState(() {
                            validate = true;
                          });
                        }
                        if (value.length < 8) {
                          setState(() {
                            validate = false;
                          });
                        }
                      },
                      autofocus: true,
                      maxLength: 8,
                      keyboardType: TextInputType.phone,
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                          labelText: 'ເບີໂທລະສັບ',
                          hintText: 'ກະລຸນາ ໃສ່ເບີໂທລະສັບຂອງທ່ານ',
                          hintStyle:
                              TextStyle(fontSize: 10, color: Colors.grey)),
                    )),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AbsorbPointer(
            absorbing: validate ? false : true,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: validate
                      ? MaterialStateProperty.all(
                          Theme.of(context).primaryColor)
                      : MaterialStateProperty.all(Colors.grey)),
              onPressed: () {
                // need to show loading
                progressDialog.show();
                String number =
                    '${countryCodeController.text}${phoneNumberController.text}';

                //phoneAuthentication(number);
                _services.verifyPhoneNumber(context, number);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
