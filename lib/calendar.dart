import 'package:flutter/material.dart';
import 'package:mevolve/sizes.dart';
import 'package:mevolve/widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var startDateSelected, endDateSelected;
  final DateRangePickerController _controller = DateRangePickerController();
  DateTime? selectedDate;
  var sHeight, sWidth;
  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
        children: [
          SizedBox(height: resHeight(253, sHeight),),
            button(sHeight, sWidth, 'Without Presets', showDate),
          SizedBox(height: resHeight(80, sHeight),),
          button(sHeight, sWidth, 'With 4 presets', with4Presets),
          SizedBox(height: resHeight(80, sHeight),),
          button(sHeight, sWidth, 'With 6 presets', with6Presets),
          // Text(_controller.selectedDate.toString()),
          SizedBox(height: resHeight(16.04, sHeight),),
          Container(
            height: resHeight(32, sHeight),
            width: resWidth(148.6, sWidth),
            decoration: BoxDecoration(
              color: Color(0xFFEDF8FF),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today_outlined, color: ,)
              ],
            ),
          ),
          SizedBox(height: resHeight(219.04, sHeight),),
          const Text('Raji Elijah O.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))
        ]        ),
      ),
    );
  }

  void showDate() {
    showDialog<Widget>(
        context: context,
        builder: (BuildContext context) {
          return SfDateRangePicker(
            // showActionButtons: true,
            view: DateRangePickerView.month,
            showNavigationArrow: true,
            onCancel: () {
              Navigator.pop(context);
            },
          );
        });
  }

  void with4Presets() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: Colors.black54,
        pageBuilder: (context, animation, secondaryAnimation) {
          return Dialog(
              insetPadding: EdgeInsets.only(left: 10, right: 10),
              elevation: 0,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: resHeight(16, sHeight), bottom: resHeight(16, sHeight)),
                  child: Row(
                    children: [
                      presetButton(false, sHeight, sWidth, "Never ends", showDate),
                      SizedBox(width: resWidth(16, sWidth),),
                      presetButton(false, sHeight, sWidth, "15 days later", showDate),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: resHeight(16, sHeight), bottom: resHeight(16, sHeight)),
                  child: Row(
                    children: [
                      presetButton(false, sHeight, sWidth, "30 days later", showDate),
                      SizedBox(width: resWidth(16, sWidth),),
                      presetButton(false, sHeight, sWidth, "60 days later", showDate),
                    ],
                  ),
                ),
                SfDateRangePicker(
                  view: DateRangePickerView.month,
                  showNavigationArrow: true,
                  // onCancel: () {
                  //   Navigator.pop(context);
                  // },
                ),
                // SizedBox(height: resHeight(21.88, sHeight),),
                Padding(
                  padding: EdgeInsets.only(bottom: resHeight(20, sHeight), left: resHeight(16, sHeight)),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, color: Color(0xFF1DA1F2),),
                      SizedBox(width: resWidth(12, sWidth),),
                      Container(
                          width: resWidth(89, sWidth),
                          child: Text('24-5-2022', style: TextStyle(fontSize: resHeight(16, sHeight), ),)),
                      SizedBox(width: resWidth(80.42, sWidth),),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height : resHeight(40, sHeight),
                          width: resWidth(73, sWidth),
                          decoration: BoxDecoration(
                              color: Color(0xFFEDF8FF),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: Text('Cancel', style: TextStyle(fontSize: resHeight(16, sHeight), color: Color(0xFF1DA1F2),
                              fontWeight: FontWeight.w500, ),),
                          ),
                        ),
                      ),
                      SizedBox(width: resWidth(16, sWidth),),
                      Container(
                        height : resHeight(40, sHeight),
                        width: resWidth(73, sWidth),
                        decoration: BoxDecoration(
                            color: Color(0xFF1DA1F2),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: Text('Save', style: TextStyle(fontSize: resHeight(16, sHeight), color: Colors.white,
                            fontWeight: FontWeight.w500, ),),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          );
        }
    );
  }

  void with6Presets() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: Colors.black54,
        pageBuilder: (context, animation, secondaryAnimation) {
          return Dialog(
              insetPadding: EdgeInsets.only(left: 10, right: 10),
              elevation: 0,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: resHeight(16, sHeight), bottom: resHeight(16, sHeight)),
                    child: Row(
                      children: [
                        presetButton(false, sHeight, sWidth, "Yesterday", showDate),
                        SizedBox(width: resWidth(16, sWidth),),
                        presetButton(false, sHeight, sWidth, "Today", showDate),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: resHeight(16, sHeight), bottom: resHeight(16, sHeight)),
                    child: Row(
                      children: [
                        presetButton(false, sHeight, sWidth, "Tomorrow", showDate),
                        SizedBox(width: resWidth(16, sWidth),),
                        presetButton(false, sHeight, sWidth, "This Saturday", showDate),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: resHeight(16, sHeight), bottom: resHeight(16, sHeight)),
                    child: Row(
                      children: [
                        presetButton(false, sHeight, sWidth, "This Sunday", showDate),
                        SizedBox(width: resWidth(16, sWidth),),
                        presetButton(false, sHeight, sWidth, "Next Tuesday", showDate),
                      ],
                    ),
                  ),
                  SfDateRangePicker(
                    controller: _controller,
                    // showActionButtons: true,
                    view: DateRangePickerView.month,
                    showNavigationArrow: true,
                    // onCancel: () {
                    //   Navigator.pop(context);
                    // },
                  ),
                  // SizedBox(height: resHeight(21.88, sHeight),),
                  Padding(
                    padding: EdgeInsets.only(bottom: resHeight(20, sHeight), left: resHeight(16, sHeight)),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, color: Color(0xFF1DA1F2),),
                        SizedBox(width: resWidth(12, sWidth),),
                        Container(
                            width: resWidth(89, sWidth),
                            child: Text('24-5-2022', style: TextStyle(fontSize: resHeight(16, sHeight), ),)),
                        SizedBox(width: resWidth(80.42, sWidth),),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            height : resHeight(40, sHeight),
                            width: resWidth(73, sWidth),
                            decoration: BoxDecoration(
                                color: Color(0xFFEDF8FF),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(
                              child: Text('Cancel', style: TextStyle(fontSize: resHeight(16, sHeight), color: Color(0xFF1DA1F2),
                                fontWeight: FontWeight.w500, ),),
                            ),
                          ),
                        ),
                        SizedBox(width: resWidth(16, sWidth),),
                        GestureDetector(
                          onTap: (){
                            setState((){
                              selectedDate = _controller.displayDate;
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            height : resHeight(40, sHeight),
                            width: resWidth(73, sWidth),
                            decoration: BoxDecoration(
                                color: Color(0xFF1DA1F2),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(
                              child: Text('Save', style: TextStyle(fontSize: resHeight(16, sHeight), color: Colors.white,
                                fontWeight: FontWeight.w500, ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
          );
        }
    );
  }
}