import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  RangeValues _currentMakeRangeValues = const RangeValues(2006, 2016);
  RangeValues _currentPriceRangeValues = const RangeValues(60000, 125000);
  RangeValues _currentMileageRangeValues = const RangeValues(30000, 120000);

  var makeStartRangeController = TextEditingController();
  var makeEndRangeController = TextEditingController();
  var priceStartRangeController = TextEditingController();
  var priceEndRangeController = TextEditingController();
  var mileageStartRangeController = TextEditingController();
  var mileageEndRangeController = TextEditingController();

  List<String> selectedBodyList = [];

  List<String> bodyList = [
    "Executive Coach",
    "Limo Bus",
    "Limousin Vans",
    "Luxury Sedan",
    "Luxury SUV",
    "Mini Coach",
    "Motor Coach",
  ];

  List<String> selectedTransmissionList = [];

  List<String> transmissionList = [
    "Automatic",
    "Manual",
    "Allison",
    "Automated Manual Transmission",
    "CVT"
  ];

  @override
  void initState() {
    makeStartRangeController.text =
        _currentMakeRangeValues.start.round().toString();
    makeEndRangeController.text =
        _currentMakeRangeValues.end.round().toString();
    priceStartRangeController.text =
        _currentPriceRangeValues.start.round().toString();
    priceEndRangeController.text =
        _currentPriceRangeValues.end.round().toString();
    mileageStartRangeController.text =
        _currentMileageRangeValues.start.round().toString();
    mileageEndRangeController.text =
        _currentMileageRangeValues.end.round().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff00B241),
          title: Text("Refine Your Search")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Top Heading
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15, left: 8),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.local_offer_outlined,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Price Range",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),
            //Input Fields
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: priceStartRangeController,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: "Search vehicles",
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Colors.green.shade300, width: 0.5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5))),
                      // decoration: const InputDecoration(
                      //     border: OutlineInputBorder(), hintText: 'a'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7, right: 7),
                  child: Text("to"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextField(
                      controller: priceEndRangeController,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: "Search vehicles",
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Colors.green.shade300, width: 0.5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5))),

                      // decoration: const InputDecoration(
                      //     border: OutlineInputBorder(), hintText: 'a'),
                    ),
                  ),
                ),
              ],
            ),
            //Slider range
            Row(
              children: [
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.green,
                      inactiveTrackColor: Colors.grey.shade200,
                      trackShape: RoundedRectSliderTrackShape(),
                      trackHeight: 2.0,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 14.0),
                      thumbColor: Colors.green.shade400,
                      overlayColor: Colors.green.withAlpha(32),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                      tickMarkShape: RoundSliderTickMarkShape(),
                      activeTickMarkColor: Colors.green[700],
                      inactiveTickMarkColor: Colors.green[100],
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.green.withOpacity(0),
                      valueIndicatorTextStyle:
                          TextStyle(color: Colors.white.withOpacity(0)),
                    ),
                    child: RangeSlider(
                      values: _currentPriceRangeValues,
                      min: 0,
                      max: 500000,
                      divisions: 100,
                      labels: RangeLabels(
                        _currentPriceRangeValues.start.round().toString(),
                        _currentPriceRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentPriceRangeValues = values;
                          priceStartRangeController.text =
                              values.start.round().toString();
                          priceEndRangeController.text =
                              values.end.round().toString();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            //top heading
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15, left: 8),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.speed,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Mileage (Miles)",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),
            //Input Fields
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: mileageStartRangeController,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: "Search vehicles",
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Colors.green.shade300, width: 0.5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5))),
                      // decoration: const InputDecoration(
                      //     border: OutlineInputBorder(), hintText: 'a'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7, right: 7),
                  child: Text("to"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextField(
                      controller: mileageEndRangeController,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: "Search vehicles",
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Colors.green.shade300, width: 0.5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5))),

                      // decoration: const InputDecoration(
                      //     border: OutlineInputBorder(), hintText: 'a'),
                    ),
                  ),
                ),
              ],
            ),
            //Slider range
            Row(
              children: [
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.green,
                      inactiveTrackColor: Colors.grey.shade200,
                      trackShape: RoundedRectSliderTrackShape(),
                      trackHeight: 2.0,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 14.0),
                      thumbColor: Colors.green.shade400,
                      overlayColor: Colors.green.withAlpha(32),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                      tickMarkShape: RoundSliderTickMarkShape(),
                      activeTickMarkColor: Colors.green[700],
                      inactiveTickMarkColor: Colors.green[100],
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.green.withOpacity(0),
                      valueIndicatorTextStyle:
                          TextStyle(color: Colors.white.withOpacity(0)),
                    ),
                    child: RangeSlider(
                      values: _currentMileageRangeValues,
                      min: 0,
                      max: 200000,
                      divisions: 100,
                      labels: RangeLabels(
                        _currentMileageRangeValues.start.round().toString(),
                        _currentMileageRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentMileageRangeValues = values;
                          mileageStartRangeController.text =
                              values.start.round().toString();
                          mileageEndRangeController.text =
                              values.end.round().toString();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            //Top Heading
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding:
                            EdgeInsets.only(top: 15, bottom: 15, left: 8.0),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.calendar_today_outlined,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Model Year Range",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),
            //Input Fields
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: makeStartRangeController,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: "Search vehicles",
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Colors.green.shade300, width: 0.5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5))),
                      // decoration: const InputDecoration(
                      //     border: OutlineInputBorder(), hintText: 'a'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7, right: 7),
                  child: Text("to"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextField(
                      controller: makeEndRangeController,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: "Search vehicles",
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Colors.green.shade300, width: 0.5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5))),

                      // decoration: const InputDecoration(
                      //     border: OutlineInputBorder(), hintText: 'a'),
                    ),
                  ),
                ),
              ],
            ),
            //Slider range
            Row(
              children: [
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.green,
                      inactiveTrackColor: Colors.grey.shade200,
                      trackShape: RoundedRectSliderTrackShape(),
                      trackHeight: 2.0,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 14.0),
                      thumbColor: Colors.green.shade400,
                      overlayColor: Colors.green.withAlpha(32),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                      tickMarkShape: RoundSliderTickMarkShape(),
                      activeTickMarkColor: Colors.green[700],
                      inactiveTickMarkColor: Colors.green[100],
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.green.withOpacity(0),
                      valueIndicatorTextStyle:
                          TextStyle(color: Colors.white.withOpacity(0)),
                    ),
                    child: RangeSlider(
                      values: _currentMakeRangeValues,
                      min: 1970,
                      max: 2021,
                      divisions: 100,
                      labels: RangeLabels(
                        _currentMakeRangeValues.start.round().toString(),
                        _currentMakeRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentMakeRangeValues = values;
                          makeStartRangeController.text =
                              values.start.round().toString();
                          makeEndRangeController.text =
                              values.end.round().toString();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15, left: 8),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.drive_eta,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Body Type",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: MultiSelectChip(
                  bodyList,
                  onSelectionChanged: (selectedList) {
                    setState(() {
                      selectedBodyList = selectedList;
                    });
                  },
                ),
              ),
            ),

            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding:
                            EdgeInsets.only(top: 15, bottom: 15, left: 8.0),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.settings,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Transmission",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: MultiSelectChip(
                  transmissionList,
                  onSelectionChanged: (selectedList) {
                    setState(() {
                      selectedTransmissionList = selectedList;
                    });
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
              child: MaterialButton(
                height: 50,
                // minWidth: double.infinity,
                minWidth: 150,
                // shape:          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
                onPressed: () {
                  print("saving search status");
                },
                color: Colors.green,
                child: Text(
                  "Update Search Results",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged; // +added
  MultiSelectChip(this.reportList, {required this.onSelectionChanged} // +added
      );
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = [];
  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(selectedChoices.contains(item)
          ? Container(
              padding: const EdgeInsets.all(2.0),
              child: ChoiceChip(
                labelStyle: TextStyle(color: Colors.grey.shade800),
                backgroundColor: Colors.grey.shade200,
                selectedColor: Colors.grey.shade200,
                // selectedShadowColor: Colors.green.shade300,

                avatar: new CircleAvatar(
                    backgroundColor: Colors.green,
                    child:
                        Icon(Icons.check_sharp, size: 14, color: Colors.white)),

                label: Text(item),
                selected: selectedChoices.contains(item),
                onSelected: (selected) {
                  setState(() {
                    selectedChoices.contains(item)
                        ? selectedChoices.remove(item)
                        : selectedChoices.add(item);
                    widget.onSelectionChanged(selectedChoices); // +added
                  });
                },
              ),
            )
          : Container(
              padding: const EdgeInsets.all(2.0),
              child: ChoiceChip(
                labelStyle: TextStyle(color: Colors.grey.shade700),

                backgroundColor: Colors.grey.shade200,
                selectedColor: Colors.grey.shade200,
                // selectedShadowColor: Colors.green.shade300,

                label: Text(item),
                selected: selectedChoices.contains(item),
                onSelected: (selected) {
                  setState(() {
                    selectedChoices.contains(item)
                        ? selectedChoices.remove(item)
                        : selectedChoices.add(item);
                    widget.onSelectionChanged(selectedChoices); // +added
                  });
                },
              ),
            ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
