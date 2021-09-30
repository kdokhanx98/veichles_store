import 'package:flutter/material.dart';
import 'package:motor_bike_new/provider/content_provider.dart';
import 'package:motor_bike_new/widgets/cate_date_item.dart';
import 'package:motor_bike_new/widgets/my_list_item.dart';
import 'package:motor_bike_new/widgets/veichle_recently_item.dart';
import 'package:provider/provider.dart';

class CateDataScreen extends StatefulWidget {
  static const routeName = '/CateDataScreen';
  final String id;
  final String title;
  const CateDataScreen({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  State<CateDataScreen> createState() => _CateDataScreenState();
}

class _CateDataScreenState extends State<CateDataScreen> {
  bool init = true;
  bool loading = true;
  @override
  void didChangeDependencies() {
    if (init) {
      final providerData = Provider.of<Contentrovider>(context, listen: false);
      providerData.getCageDateRequest(widget.id).then(
        (_) {
          setState(() {
            loading = false;
            init = false;
          });
        },
      );
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final recentlyAddedData =
        Provider.of<Contentrovider>(context, listen: false).getvehicleLList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00B241),
        title: Text(widget.title),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: recentlyAddedData.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return VeichleCateItem(true, index);
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
