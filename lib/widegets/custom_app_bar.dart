import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_clone/screens/login_screen.dart';

class CustomAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Material(
      elevation:4,
      borderRadius:BorderRadius.circular(10),
      child:Container(
        width:MediaQuery.of(context).size.width,
        height:40,
        decoration:BoxDecoration(
          color:Colors.white,
          borderRadius:BorderRadius.circular(4),

        ),
        child:Padding(padding:EdgeInsets.only(left:12,top:12,right:12,bottom:7),
        child:Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children:[
            Text('Search...'),
            Icon(Icons.search,color:Colors.grey),
          ]
        ),
       
        )
      )
    );
  }
}