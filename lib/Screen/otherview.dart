import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../globals.dart';
import '../mycolors.dart';
import 'playsoundscreen.dart';

class OtherView extends StatefulWidget {
  @override
  _OtherViewState createState() => _OtherViewState();
}

class _OtherViewState extends State<OtherView> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Popular",
            style: getTextStyle(
                size: 24, fcolor: Colors.black, weightf: FontWeight.w600),
          ),
          centerTitle: true,
          elevation: 0,
         leading: new Container(),
        ),
        body: FutureBuilder<QuerySnapshot>(
            // <2> Pass `Future<QuerySnapshot>` to future
            future: FirebaseFirestore.instance.collection('medi').get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.deepPurple,
                ));

              final documents = snapshot.data?.docs[0].data() as Map;
              List myval = documents["mymedprac"];

              return ListView.builder(
                  itemCount: myval.length,
                  itemBuilder: (_, index) {
                    final mydata = myval[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    PlaySoundScreen(
                                      title: mydata['title'],
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black, width: 0.1000)),
                        width: MediaQuery.of(context).size.width,
                        height: 90.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(
                                image: AssetImage('assets/images/il1_med.png'),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${mydata['title']}",
                                  style: getTextStyle(
                                      size: 16,
                                      weightf: FontWeight.bold,
                                      fcolor: Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "${mydata['time']}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4.5,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  mydata['isFav'] = !mydata['isFav'];
                                });
                              },
                              icon: !mydata['isFav']
                                  ? Icon(Icons.favorite_border)
                                  : Icon(
                                      Icons.favorite,
                                      color: MyColors.card1,
                                    ),
                            )
                          ],
                        ),
                      ),
                    );
                  });

              // if (snapshot.hasData) {
              //     final List<DocumentSnapshot<Object?>>? documents =
              //         snapshot.data?.docs;
              //   // <3> Retrieve `List<DocumentSnapshot>` from snapshot
              //  // final List<DocumentSnapshot<Object?>>? documents = snapshot.data.docs;
              //   return Container();
              // }
            }));
  }

  Widget headerWidget(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
      ],
    );
  }

  Widget getMyCard(Color colr) {
    return Container(
      margin: EdgeInsets.only(right: 15.0),
      height: 210.0,
      width: 310.0,
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


}
