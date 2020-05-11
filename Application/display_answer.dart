import 'package:flutter/material.dart';

import 'constants.dart';
import 'package:basic_utils/basic_utils.dart';



class DisplayAnswer extends StatelessWidget {
  final String word;
  final String meaning;
  final List<String> synonyms;

  DisplayAnswer({this.word, this.meaning, this.synonyms});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Padding(
          padding: EdgeInsets.only(left: 55),
          child: Text(
            "Results",
            style: TextStyle(
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.w300,
                fontSize: 28),
          ))),
      body: Container(

        child: Padding(
            padding: EdgeInsets.only(left: 8.0,top: 12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(StringUtils.capitalize(word), style: kWordTextStyle,),
                ),
                Expanded(
                  child: Text(StringUtils.capitalize(meaning), style: kMeaningTextStyle,),
                ),
                Expanded(
                  child: SizedBox(height: 5)
                ),
                Expanded(
                  child: Text("Synonyms",style: kWordTextStyle.copyWith(fontSize: 25),),
                ),

                for (var i in synonyms)Expanded(
                    child: Text('${StringUtils.capitalize(i)}',style: kMeaningTextStyle,)
                  )

              ],
            )),

        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: kColorAppCard,
            borderRadius: BorderRadius.circular(10.0)


        ),
      ),
    );

  }
}
