import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height*.25,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height:10),
                      Text('Our Services',style:TextStyle(color: Colors.white,fontSize:18,
                      fontWeight:FontWeight.bold,letterSpacing:1),
                      ),
                      SizedBox(height: 25,),
                      SizedBox(height: 45.0,
                      child: DefaultTextStyle(style: const TextStyle(fontSize: 15,
                      fontWeight: FontWeight.bold),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        isRepeatingAnimation: true,
                        animatedTexts: [
                          FadeAnimatedText('Welcome\nຍີນດີຕ້ອນຮັບ',
                          duration: Duration(seconds:4)),
                          FadeAnimatedText('ບໍລິການຈັດຊື້ຄົບວົງຈອນ',
                          duration: Duration(seconds:4)),
                           FadeAnimatedText('ມີຫຼາກຫາຍທີ່ທ່ານຕ້ອງການ',
                           duration: Duration(seconds:4)),
                        ],
                        
                      ),),)
                    ],
                    ),
                    Neumorphic(
                      style:NeumorphicStyle(color: Colors.white,
                      ),
                      child: Image.network('https://firebasestorage.googleapis.com/v0/b/dlottery.appspot.com/o/banner%2Ficons8-google-keep-100.png?alt=media&token=5a3a2900-ebf5-4aec-af39-ddd077341d71'),
                    )
                  ]
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children:[
                  Expanded(child: NeumorphicButton(
                    onPressed: (){},
                    child: Text('Buy',textAlign:TextAlign.center),
                  )),
                  SizedBox(width:20),
                  Expanded(child: NeumorphicButton(
                    onPressed: (){},
                    child: Text('Sell',textAlign:TextAlign.center),
                  )),
                ]
              ),
              
            ],
          ),
          
        ),
      ),
      
    );
    
  }
  
}