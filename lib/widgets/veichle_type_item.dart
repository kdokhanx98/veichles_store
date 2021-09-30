import 'package:flutter/material.dart';
import 'package:motor_bike_new/screens/cate_data_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

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
  final bool viewAll;

  const VeichleTypeItem(
      {this.count,
      this.description,
      this.id,
      this.isSelected,
      this.menuOrder,
      this.name,
      this.parent,
      this.slug,
      this.image,
      required this.viewAll});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        print("test click");
      },
      child: Container(
        width: viewAll ? width * 0.4 : width * 0.35,
        //    margin: viewAll
        //          ? EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8)
        //   : EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: () {
                  pushNewScreen(
                    context,
                    screen: CateDataScreen(
                      id: id.toString(),
                      title: name!,
                    ),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: Container(
                    width: viewAll ? width * 0.7 : width * 0.35,
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
                      viewAll
                          ? Container(
                              width: width,
                              height: height * 0.2,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: image == "false"
                                      ? NetworkImage(
                                          "https://www.phi.edu.eg/public/images/image_placeholder.jpg")
                                      : NetworkImage(image!),
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                            )
                          : Container(
                              width: width * 0.35,
                              height: height * 0.11,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: image == "false"
                                      ? NetworkImage(
                                          "https://www.phi.edu.eg/public/images/image_placeholder.jpg")
                                      : NetworkImage(image!),
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
                      viewAll
                          ? Text(
                              name!,
                              style: TextStyle(fontSize: 18),
                            )
                          : Text(
                              name!,
                              style: TextStyle(fontSize: 15),
                            ),
                      SizedBox(
                        height: height * 0.009,
                      ),
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
