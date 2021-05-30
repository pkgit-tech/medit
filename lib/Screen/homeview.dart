import 'package:flutter/material.dart';
import '../globals.dart';
import '../mycolors.dart';
import './otherview.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Widget getMyCard(Color colr) {
    return Container(
      margin: EdgeInsets.only(right: 15.0),
      height: 160.0,
      width: 280.0,
      decoration: BoxDecoration(
        color: colr,
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
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Anxiety",
                  style: getTextStyle(
                      size: 28, fcolor: Colors.white, weightf: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  "Turn down the streets",
                  style: getTextStyle(
                      size: 16,
                      fcolor: Colors.white54,
                      weightf: FontWeight.normal),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(left: 10.0, top: 20.0, bottom: 15),
                child: Text(
                  "7 Steps | 5-11 min",
                  style: getTextStyle(
                      size: 13,
                      fcolor: Colors.white54,
                      weightf: FontWeight.normal),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              //   height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/tree_med.png'),
              )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget horizontalList1 = new Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        height: 150,
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            getMyCard(MyColors.card1),
            getMyCard(MyColors.card2),
            //  getMyCard(),
          ],
        ));

    return Column(children: <Widget>[
      Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Background_med.png'),
                  fit: BoxFit.fill),
            ),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(top: 30.0),
                    height: MediaQuery.of(context).size.height / 3.9,
                    width: MediaQuery.of(context).size.width / 6.2,
                    child: Image(
                      image: AssetImage('assets/images/nat1_med.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 20, left: 10.0),
                  height: MediaQuery.of(context).size.height / 5.5,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "DAY 1",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white60, fontSize: 10.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Love And Accept",
                            style: getTextStyle(
                                fcolor: Colors.white,
                                weightf: FontWeight.bold,
                                size: 30),
                          ),
                          Text(
                            "Yourself",
                            style: getTextStyle(
                                fcolor: Colors.white,
                                weightf: FontWeight.bold,
                                size: 25),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5.8,
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: Image(
                      image: AssetImage('assets/images/nature_med.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(top: 100.0, right: 10.0),
              height: MediaQuery.of(context).size.height / 3.8,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/girl_med.png'),
                fit: BoxFit.fill,
              )),
            ),
          ),
        ],
      ),
      Flexible(
        child: new Container(
          //margin: EdgeInsets.only(bottom: 100),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 8.0),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, right: 15),
                child: headerWidget("Popular"),
              ),
              horizontalList1,
              Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, bottom: 10, right: 15),
                child: headerWidget("New"),
              ),
              horizontalList1,
              Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, bottom: 10, right: 15),
                child: headerWidget("Latest"),
              ),
              horizontalList1,
            ],
          ),
        ),
      ),
    ]);
  }

  Widget headerWidget(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 50.0,
        ),
        Text(
          title,
          textAlign: TextAlign.left,
          style: getTextStyle(
              fcolor: Colors.black, weightf: FontWeight.w500, size: 25),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.8,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OtherView()));
          },
          child: Text(
            "See All",
            textAlign: TextAlign.right,
            style: getTextStyle(
                fcolor: MyColors.blueTypeColor,
                weightf: FontWeight.w500,
                size: 16),
          ),
        ),
      ],
    );
  }
}
