import 'package:flutter/material.dart';
import 'package:motor_bike_new/provider/content_provider.dart';
import 'package:motor_bike_new/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class MyListItem extends StatelessWidget {
  final bool isLiked;
  final int index;
  const MyListItem(this.isLiked, this.index);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    final recentlyAddedData =
        Provider.of<Contentrovider>(context, listen: false).getvehicleLList;

    return InkWell(
      onTap: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return ProductDetailsScreen(id: recentlyAddedData[index].id!);
        }));
      },
      child: Container(
        height: height * 0.36,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15, left: 5, right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
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
                    child: recentlyAddedData[index].image!.length == 0
                        ? Image.asset("assets/image_placeholder.jpg",
                            fit: BoxFit.cover,
                            height: width * 0.35,
                            width: width * 0.29)
                        : Image.network(recentlyAddedData[index].image![0],
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
                            recentlyAddedData[index].title!,
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
                                color: isLiked ? Colors.pink : Colors.grey,
                              ),
                              onPressed: () {},
                              color:
                                  isLiked ? Colors.pink : Colors.grey.shade500,
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.015),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '\$${recentlyAddedData[index].carleaderListingPrice}',
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  SizedBox(height: height * 0.02),
                                  Icon(Icons.soap_outlined,
                                      color: Colors.yellow.shade800),
                                ],
                              ),
                            ),
                          ],
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
                              Text(recentlyAddedData[index].yser!,
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
                                recentlyAddedData[index]
                                        .carleaderListingMiles! +
                                    "mi",
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
                                recentlyAddedData[index]
                                    .carleaderListingEngineflue!,
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
