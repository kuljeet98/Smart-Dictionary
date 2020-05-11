import 'package:dio/dio.dart';
import 'dart:io';

import 'package:flutter/material.dart';

import 'display_answer.dart';

class DisplayPicture extends StatefulWidget {
  DisplayPicture({@required this.imagePath});
  final File imagePath;

  @override
  _DisplayPictureState createState() => _DisplayPictureState(imagePath);
}

class _DisplayPictureState extends State<DisplayPicture> {
  File theImagePath;

  _DisplayPictureState(this.theImagePath);

  Dio dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Display Image",
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.w300,
                    fontSize: 28),
              ))),
      body: Image.file(theImagePath),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent[900],
          child: Icon(Icons.check),
          onPressed: () async {
            print("pressed");

            try {
              String theFilename = theImagePath.path.split('/').last;
              print(theFilename);
              print(theImagePath);



              FormData formData = new FormData.fromMap({
                "file": await MultipartFile.fromFile(theImagePath.path,
                    filename: theFilename)
              });
              //add multipart to request

              Response response =
                  await dio.post('http://192.168.1.10:5000', data: formData);

              if (response.statusCode == 200) {
                print(response.data);

                String word = (response.data[1][0][0]).toString();
                String meaning = (response.data[1][0][2]).toString();
                List<dynamic> synonyms = response.data[1][1][2];
                print(synonyms.length);

                List<String> synonymString = [];

                for (int i = 0; i < synonyms.length; i++) {
                  print("loop $i ${synonyms[i].toString()}");
                  var temp = synonyms[i].toString();
                  synonymString.add(temp);
                }

                print(word);
                print(meaning);
                print(synonymString);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayAnswer(
                              word: word,
                              meaning: meaning,
                              synonyms: synonymString,
                            )));
              }
            } catch (e) {
              print(e);
            }
          }),
    );
  }
}
