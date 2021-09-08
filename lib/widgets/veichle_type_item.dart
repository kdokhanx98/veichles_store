import 'package:flutter/material.dart';

class VeichleTypeItem extends StatelessWidget {
  final int? count;
  final String? description;
  final int? id;
  final bool? isSelected;
  final int? menuOrder;
  final String? name;
  final int? parent;
  final String? slug;
  final String? image;

  const VeichleTypeItem(
      {this.count,
      this.description,
      this.id,
      this.isSelected,
      this.menuOrder,
      this.name,
      this.parent,
      this.slug,
      this.image});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        print("test click");
      },
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: <Widget>[
            Container(
                width: width * 0.35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(children: [
                  Container(
                    width: width * 0.35,
                    height: height * 0.12,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/motor-coach.jpg"),
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ), //cat circles

                  SizedBox(
                    height: height * 0.009,
                  ),
                  Text(
                    "Limo Bus",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: height * 0.009,
                  ),
                ])),
            // SizedBox(height: spacing_control),
            // text(list[index].name,
            //     textColor: colors[index % colors.length],
            //     fontFamily: fontMedium)
          ],
        ),
      ),
    );
  }
}
