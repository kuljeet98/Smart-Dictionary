

import 'package:flutter/material.dart';



import 'package:path_provider/path_provider.dart';


import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'display_picture.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();

}

class _AppHomePageState extends State<AppHomePage> {


  File theImage;
  File newImage;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    String path = (await getTemporaryDirectory()).path;

    setState(() {
      theImage = image;




      print(image);
    });
    newImage = await theImage.copy('$path/${DateTime.now().millisecondsSinceEpoch}.jpg');

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Smart OCR Dictionary',style: TextStyle(fontFamily: 'Pacifico', fontWeight: FontWeight.bold, fontSize: 28),)),
      ),
      floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.greenAccent[900],
      child: Icon(Icons.photo),
      onPressed: () async{
        await getImage();
        Navigator.push(context,MaterialPageRoute(builder: (context)=>DisplayPicture(imagePath: newImage)) );
      },



      ),
      body: Column(
        children: <Widget>[

          Expanded(
            child: SvgPicture.asset("assetImages/undraw.svg"),
          )




        ],

      ),
    );
  }
}

