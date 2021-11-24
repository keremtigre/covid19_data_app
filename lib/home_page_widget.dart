import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedTextButton = "baba";
  String dropDownValue="TR";
  @override
  Widget build(BuildContext context) {
    //total,yestarday,today selected contoller
    List<bool> isSelected = [false, false, false];
    return Scaffold(
      body: Column(
        children:<Widget>[
          Expanded(
            flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end:  Alignment.bottomCenter,
                    colors: [
                      Colors.indigo,
                      Colors.teal,


                    ],
                  )
                ),
                padding: EdgeInsets.only(left: 20,top: 20),
                alignment: Alignment.topLeft,
                width: double.infinity,
                //1. container Column
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration:BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
                      width: 140,
                      height: 45,
                      //1. container Column'in rowu sol üst Ülke kısmı
                      child: Row(
                        children: <Widget>[
                      Container(padding: EdgeInsets.only(left: 1),child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset("images/turkey_flag.png",width: 40,height: 40,))),
                           Padding(
                             padding: EdgeInsets.only(left: 5),
                             child: DropdownButton(
                               underline: Container(height: 2,color:Colors.black),
                               icon: Icon(Icons.keyboard_arrow_down_rounded,size: 30,),
                               style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 17),
                              onChanged: (String? deger) {
                                setState(() {dropDownValue=deger!;});},
                              value: dropDownValue,
                              iconSize: 15,
                              items: <String>["TR","USA","FR","ES"].map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                              child: Text(value),
                                            value: value,
                                          );
                          }).toList(),
                          ),
                           )
                        ],
                      ),
                    ),
                    //Text Statistics
                    SizedBox(height: 30,),
                    Text("Statistics",style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(height: 30,),
                    Container(
                      margin: EdgeInsets.only(right: 14),
                      alignment: Alignment.topCenter,
                      child: ToggleSwitch(
                        minWidth: 180,
                        cornerRadius: 20.0,
                        activeBgColors: [[Colors.white], [Colors.white]],
                        activeFgColor: Colors.black,
                        inactiveBgColor: Colors.indigo.shade200,
                        inactiveFgColor: Colors.black,
                        initialLabelIndex: 1,
                        totalSwitches: 2,
                        labels: ['Global', 'My Country'],
                        radiusStyle: true,
                        onToggle: (index) {
                          print('switched to: $index');
                        },
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTextButton = "today";
                                });
                              },
                              child: Text("Today",style:TextStyle(color: selectedTextButton=="today" ? Colors.white :Colors.indigo.shade200,fontSize: 20))),
                        ),

                        TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTextButton = "yestarday";
                              });
                            },
                            child: Text("Yestarday",style: TextStyle(color: selectedTextButton=="yestarday" ? Colors.white :Colors.indigo.shade200,fontSize: 20),)),

                        Padding(
                          padding: EdgeInsets.only(right: 50),
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTextButton = "total";
                                });
                              },
                              child: Text("Total",style: TextStyle(color: selectedTextButton=="total" ? Colors.white :Colors.indigo.shade200,fontSize: 20),)),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 90,width: 160,
                          decoration: BoxDecoration(
                            color:Colors.orange,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(padding: EdgeInsets.all(8),child: Text("Affected",style: TextStyle(color: Colors.white,fontSize: 17, ),)),
                              Container(padding: EdgeInsets.all(10),child: Text("300.000",style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold),)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Container(
                            height: 90,width: 160,
                            decoration: BoxDecoration(
                              color:Colors.red,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(padding: EdgeInsets.all(8),child: Text("Death",style: TextStyle(color: Colors.white,fontSize: 17, ),)),
                                Container(padding: EdgeInsets.all(10),child: Text("2.000",style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold),)),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 7),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.all(8),child: Text("Recovered",style: TextStyle(color: Colors.white,fontSize: 16),)),
                                  Padding(padding: EdgeInsets.all(10),child: Text("300.000",style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),))
                                ],
                            ),
                            height: 90,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.green,
                            borderRadius: BorderRadius.circular(15),
                          ),),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.all(8),child: Text("Active",style: TextStyle(color: Colors.white,fontSize: 16),)),
                              Padding(padding: EdgeInsets.all(10),child: Text("300.000",style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),))
                            ],
                          ),
                          height: 90,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 13),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.all(8),child: Text("Serious",style: TextStyle(color: Colors.white,fontSize: 16),)),
                                  Padding(padding: EdgeInsets.all(10),child: Text("300.000",style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),))
                                ],
                              ),
                              height: 90,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            )
                        )
                      ],
                    )


                  ],

                ),
              )
          ),
          Expanded(
            flex: 1,
            child: Stack(
               children: [
                 Container(
                   color: Colors.teal,
                 ),
                 Container(
                   width: double.infinity,
                   height: double.infinity,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [

                     Container(child: Text("Sevdiklerimiz İçin Kurallara Uyalım",style: TextStyle(fontSize: 20,color: Colors.black),)),
                      Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Expanded(child: Image.asset("images/hijyen_resmi.png",height: 80,width: 80,),),
                         Expanded(child: Image.asset("images/maske_resmi.png",height: 80,width: 80,),),
                         Expanded(child: Image.asset("images/mesafe.png",height: 60,width: 60,),)
                       ],
                     ),
                   ],
                   ),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                   ),
                 )
               ],
            ),
          ),
        ],
      )
    );
  }
}
