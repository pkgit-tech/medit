import 'package:flutter/material.dart';
import 'package:medi/globals.dart';
import 'package:medi/mycolors.dart';

class ProviewView extends StatefulWidget {
  @override
  _ProviewViewState createState() => _ProviewViewState();
}

class _ProviewViewState extends State<ProviewView> {
  final double fillPercent = 56.23; // fills 56.23% for container from bottom
  final Color background = Colors.grey;
  final Color fill = Colors.redAccent;
  List<Color> gradient = [];
  @override
  void initState() {
    // TODO: implement initState
    gradient = [
      background,
      background,
      fill,
      fill,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
      SizedBox(
        height: MediaQuery.of(context).size.height / 10,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 15),
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/iconfill_med.png'))),
        ),
        Container(
          margin: EdgeInsets.only(right: 22),
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/setting.png'))),
        ),
      ]),
      Column(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: height / 7,
              width: height / 7,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/avatar_med.png"))),
            ),
            SizedBox(height: 10.0),
            Text(
              "Natalia Lebediva",
              style: getTextStyle(
                  size: 25, weightf: FontWeight.w500, fcolor: Colors.black),
            )
          ],
        ),
        bmysessionwidget("Practices", 'assets/images/icon-practices.png'),
        bmysessionwidget("Meditation", 'assets/images/icon-meditations.png'),
        Container(
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.only(left: 12, top: 12),
            decoration: BoxDecoration(
              color: MyColors.card3,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
              // image: DecorationImage(
              //     image: AssetImage('assets/images/bg2_med.png'),
              //     fit: BoxFit.fill)
            ),
            height: 220,
            width: MediaQuery.of(context).size.width - 20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("State",
                        style: getTextStyle(
                            size: 24,
                            weightf: FontWeight.normal,
                            fcolor: Colors.black)),
                    Row(
                      children: [
                        Text("Last Week"),
                        Icon(Icons.arrow_drop_down)
                      ],
                    )
                  ],
                ),
                myStateWidget("Practices", MyColors.card1),
                myStateWidget("Meditation", MyColors.card4),
                Expanded(
                  child: Container(
                    width: double.infinity - 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        children: <Widget>[
                          mychartWidget(gradient: [
                            MyColors.card1,
                            MyColors.card1,
                            MyColors.card1,
                            MyColors.card1,
                          ], fillPercent: 100, daytext: "Sun"),
                          mychartWidget(gradient: [
                            MyColors.card4,
                            MyColors.card4,
                            MyColors.card1,
                            MyColors.card1,
                          ], fillPercent: 60, daytext: "Mon"),
                          mychartWidget(gradient: [
                            MyColors.card1,
                            MyColors.card1,
                            MyColors.card1,
                            MyColors.card1,
                          ], fillPercent: 70, daytext: "Tue"),
                          mychartWidget(gradient: [
                            MyColors.card4,
                            MyColors.card4,
                            MyColors.card1,
                            MyColors.card1,
                          ], fillPercent: 30, daytext: "Wed"),
                          mychartWidget(gradient: [
                            MyColors.card1,
                            MyColors.card1,
                            MyColors.card1,
                            MyColors.card1,
                          ], fillPercent: 40, daytext: "Thu"),
                          mychartWidget(gradient: [
                            MyColors.card1,
                            MyColors.card1,
                            MyColors.card1,
                            MyColors.card1,
                          ], fillPercent: 75, daytext: "Fri"),
                          mychartWidget(gradient: [
                            MyColors.card4,
                            MyColors.card4,
                            MyColors.card1,
                            MyColors.card1,
                          ], fillPercent: 85, daytext: "Sat")
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ))
      ])
    ])));
  }

  Widget mychartWidget(
      {List<Color>? gradient, double? fillPercent, String? daytext}) {
    final double fillStop = (100 - fillPercent!) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    return Column(children: [
      Container(
        height: 60,
        width: 8,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient!,
            stops: stops,
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 10, right: 12),
        child: Text(daytext!),
      ),
    ]);
  }

  Widget myStateWidget(String title, Color color) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 8.0, top: 12),
          height: 10,
          width: 10,
          child: CircleAvatar(
            backgroundColor: color,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0, top: 12),
          child: Text(title,
              style: getTextStyle(
                  size: 13, weightf: FontWeight.normal, fcolor: Colors.grey)),
        )
      ],
    );
  }

  Widget bmysessionwidget(String title, String icon) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            color: MyColors.card3,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
            // image: DecorationImage(
            //     image: AssetImage('assets/images/bg2_med.png'),
            //     fit: BoxFit.fill)
          ),
          height: 116,
          width: MediaQuery.of(context).size.width - 20,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        icon,
                        height: 29,
                        width: 29,
                      ),
                    ),
                    Text(title,
                        style: getTextStyle(
                            size: 24,
                            weightf: FontWeight.normal,
                            fcolor: Colors.black))
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 8),
                      height: 50,
                      // color: Colors.green,
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 10),
                            child: Text("Session",
                                style: getTextStyle(
                                    size: 16,
                                    weightf: FontWeight.normal,
                                    fcolor: Colors.grey)),
                          ),
                          Text("13",
                              style: getTextStyle(
                                  size: 30,
                                  weightf: FontWeight.normal,
                                  fcolor: Colors.black))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.only(bottom: 8),
                      // color: Colors.green,
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 10),
                            child: Text("Time",
                                style: getTextStyle(
                                    size: 16,
                                    weightf: FontWeight.normal,
                                    fcolor: Colors.grey)),
                          ),
                          Text("4:23:4",
                              style: getTextStyle(
                                  size: 30,
                                  weightf: FontWeight.normal,
                                  fcolor: Colors.black))
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
