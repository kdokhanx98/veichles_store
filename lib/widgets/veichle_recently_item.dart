import 'package:flutter/material.dart';

class VeichleRecentlyItem extends StatelessWidget {
  final bool isLiked;

  const VeichleRecentlyItem(this.isLiked);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        print("recently clicked");
      },
      child: Container(
        height: height * 0.31,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15, left: 16, right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0)),
                    child: Image.asset("assets/2a.jpg",
                        fit: BoxFit.cover,
                        height: width * 0.35,
                        width: width * 0.29),
                  )),
              SizedBox(width: width * 0.015),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Text(
                            "2019 Ford TurtleTop Vanterra Non-CDL Executive Coach",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                size: 24,
                              ),
                              onPressed: () {},
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.015),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          child: Row(
                            children: <Widget>[
                              Text(
                                '\$87,900',
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.grey.shade800, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("2019",
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 14)),
                              Text(
                                ' | ',
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '1235 mi.',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                ' | ',
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Gasoline',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ))),
                    ),
                    SizedBox(height: height * 0.025),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
