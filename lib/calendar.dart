import 'package:flutter/material.dart';
import 'package:mevolve/formmater.dart';
import 'package:mevolve/sizes.dart';
import 'package:mevolve/widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final DateRangePickerController _controller = DateRangePickerController();
  final DateRangePickerController _with4PresetController = DateRangePickerController();
  final DateRangePickerController _with6PresetController = DateRangePickerController();
  bool withoutPreset = false;
  bool w4Presets = false;
  bool w6Presets= false;
  DateTime? selectedDate;
  var sHeight, sWidth;
  bool fifteen = false;
  bool thirty = false;
  bool neverEnd = false;
  bool sixty = false;
  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
        children: [
          SizedBox(height: resHeight(253, sHeight),),
            button(sHeight, sWidth, 'Without Presets', withoutPresets),
          SizedBox(height: resHeight(16.04, sHeight),),
          withoutPreset ? result(sHeight, sWidth, _controller.selectedDate.toString(), (){
            setState((){
              withoutPreset = false;
            });
          }): const Text(''),
          SizedBox(height: resHeight(31.96, sHeight),),
          button(sHeight, sWidth, 'With 4 presets', with4Presets),
          SizedBox(height: resHeight(16.04, sHeight),),
          w4Presets ? result(sHeight, sWidth, _with4PresetController.selectedDate.toString(), (){
            setState((){
              w4Presets = false;
            });
          }): const Text(''),
          SizedBox(height: resHeight(31.96, sHeight),),
          button(sHeight, sWidth, 'With 6 presets', with6Presets),
          SizedBox(height: resHeight(16.04, sHeight),),
          w6Presets ? result(sHeight, sWidth, _with6PresetController.selectedDate.toString(), (){
            setState((){
              w6Presets = false;
            });
          }): const Text(''),
          SizedBox(height: resHeight(221, sHeight),),
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
            view: DateRangePickerView.month,
            showNavigationArrow: true,
            onCancel: () {
              Navigator.pop(context);
            },
          );
        });
  }

  void withoutPresets() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: Colors.black54,
        pageBuilder: (context, animation, secondaryAnimation) {
          return Dialog(
              insetPadding: const EdgeInsets.only(left: 10, right: 10),
              elevation: 0,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SfDateRangePicker(
                    view: DateRangePickerView.month,
                    showNavigationArrow: true,
                    controller: _controller,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: resHeight(20, sHeight), left: resHeight(16, sHeight)),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined, color: Color(0xFF1DA1F2),),
                        SizedBox(width: resWidth(12, sWidth),),
                        SizedBox(
                            width: resWidth(89, sWidth),
                            child: Text(withoutPreset ? shortDate( _controller.selectedDate.toString()) : '', style: TextStyle(fontSize: resHeight(16, sHeight), ),)),
                        SizedBox(width: resWidth(80.42, sWidth),),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            height : resHeight(40, sHeight),
                            width: resWidth(73, sWidth),
                            decoration: BoxDecoration(
                                color: const Color(0xFFEDF8FF),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(
                              child: Text('Cancel', style: TextStyle(fontSize: resHeight(16, sHeight), color: const Color(0xFF1DA1F2),
                                fontWeight: FontWeight.w500, ),),
                            ),
                          ),
                        ),
                        SizedBox(width: resWidth(16, sWidth),),
                        GestureDetector(
                          onTap: (){
                            setState((){
                              selectedDate = _controller.displayDate;
                              withoutPreset = true;
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            height : resHeight(40, sHeight),
                            width: resWidth(73, sWidth),
                            decoration: BoxDecoration(
                                color: const Color(0xFF1DA1F2),
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


  // void
  void with4Presets() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: Colors.black54,
        pageBuilder: (context, animation, secondaryAnimation) {
          return StatefulBuilder(
            builder: (context, setState) {
              void neverEnds(){
                setState((){
                  sixty = false; thirty = false; fifteen = false;
                  neverEnd = !neverEnd;
                });
              }
              void sixtyDays(){
                setState((){
                  sixty = !sixty; thirty = false; fifteen = false;
                  neverEnd = false;
                });
              }
              void thirtydays() {
                setState((){ neverEnd = false;
                  thirty = !thirty; sixty = false; fifteen = false;
                });
              }
              void fifteenDays() {
                setState((){ neverEnd = false;
                  fifteen = !fifteen; sixty = false; thirty = false;
                });
              }
              return Dialog(
                  insetPadding: const EdgeInsets.only(left: 10, right: 10),
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
                          presetButton(neverEnd, sHeight, sWidth, "Never ends", neverEnds),
                          SizedBox(width: resWidth(16, sWidth),),
                          presetButton(fifteen, sHeight, sWidth, "15 days later", fifteenDays),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: resHeight(16, sHeight), bottom: resHeight(16, sHeight)),
                      child: Row(
                        children: [
                          presetButton(thirty, sHeight, sWidth, "30 days later", thirtydays),
                          SizedBox(width: resWidth(16, sWidth),),
                          presetButton(sixty, sHeight, sWidth, "60 Days Later", sixtyDays),
                        ],
                      ),
                    ),
                    SfDateRangePicker(
                      view: DateRangePickerView.month,
                      showNavigationArrow: true,
                      controller: _with4PresetController,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: resHeight(20, sHeight), left: resHeight(16, sHeight)),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today_outlined, color: Color(0xFF1DA1F2),),
                          SizedBox(width: resWidth(12, sWidth),),
                          SizedBox(
                              width: resWidth(89, sWidth),
                              child: Text(w4Presets ? shortDate( _with4PresetController.selectedDate.toString()): '', style: TextStyle(fontSize: resHeight(16, sHeight), ),)),
                          SizedBox(width: resWidth(80.42, sWidth),),
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              height : resHeight(40, sHeight),
                              width: resWidth(73, sWidth),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFEDF8FF),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(
                                child: Text('Cancel', style: TextStyle(fontSize: resHeight(16, sHeight), color: const Color(0xFF1DA1F2),
                                  fontWeight: FontWeight.w500, ),),
                              ),
                            ),
                          ),
                          SizedBox(width: resWidth(16, sWidth),),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                selectedDate = _with4PresetController.displayDate;
                                w4Presets = true;
                              });
                              Navigator.pop(context);
                            },
                            child: Container(
                              height : resHeight(40, sHeight),
                              width: resWidth(73, sWidth),
                              decoration: BoxDecoration(
                                  color: const Color(0xFF1DA1F2),
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
    );
  }

  void with6Presets() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: Colors.black54,
        pageBuilder: (context, animation, secondaryAnimation) {
          return StatefulBuilder(
            builder: (context, setState) {
              void yesterdays() {
                setState((){ today = false;
                yesterday = !yesterday; tomorrow = false; thisSat = false;
                thisSun = false; nextTue = false;
                });
              }
              void todays() {
                setState((){ today = !today;
                yesterday = false; tomorrow = false; thisSat = false;
                thisSun = false; nextTue = false;
                });
              }
              void tomorrows() {
                setState((){ today = false;
                yesterday = false; tomorrow = !tomorrow; thisSat = false;
                thisSun = false; nextTue = false;
                });
              }
              void thisSaturday() {
                setState((){ today = false;
                yesterday = false; tomorrow = false; thisSat = !thisSat;
                thisSun = false; nextTue = false;
                });
              }
              void thisSunday() {
                setState((){ today = false;
                yesterday = false; tomorrow = false; thisSat = false;
                thisSun = !thisSun; nextTue = false;
                });
              }
              void nextTuesday() {
                setState((){ today = false;
                yesterday = false; tomorrow = false; thisSat = false;
                thisSun = false; nextTue = !nextTue;
                });
              }
              return Dialog(
                  insetPadding: const EdgeInsets.only(left: 10, right: 10),
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
                            presetButton(yesterday, sHeight, sWidth, "Yesterday", yesterdays),
                            SizedBox(width: resWidth(16, sWidth),),
                            presetButton(today, sHeight, sWidth, "Today", todays),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: resHeight(16, sHeight), bottom: resHeight(16, sHeight)),
                        child: Row(
                          children: [
                            presetButton(tomorrow, sHeight, sWidth, "Tomorrow", tomorrows),
                            SizedBox(width: resWidth(16, sWidth),),
                            presetButton(thisSat, sHeight, sWidth, "This Saturday", thisSaturday),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: resHeight(16, sHeight), bottom: resHeight(16, sHeight)),
                        child: Row(
                          children: [
                            presetButton(thisSun, sHeight, sWidth, "This Sunday", thisSunday),
                            SizedBox(width: resWidth(16, sWidth),),
                            presetButton(nextTue, sHeight, sWidth, "Next Tuesday", nextTuesday),
                          ],
                        ),
                      ),
                      SfDateRangePicker(
                        controller: _with6PresetController,
                        view: DateRangePickerView.month,
                        showNavigationArrow: true,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: resHeight(20, sHeight), left: resHeight(16, sHeight)),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_today_outlined, color: Color(0xFF1DA1F2),),
                            SizedBox(width: resWidth(12, sWidth),),
                            SizedBox(
                                width: resWidth(89, sWidth),
                                child: Text(w6Presets ? shortDate(_with6PresetController.selectedDate.toString()): '', style: TextStyle(fontSize: resHeight(16, sHeight), ),)),
                            SizedBox(width: resWidth(80.42, sWidth),),
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                height : resHeight(40, sHeight),
                                width: resWidth(73, sWidth),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFEDF8FF),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(
                                  child: Text('Cancel', style: TextStyle(fontSize: resHeight(16, sHeight), color: const Color(0xFF1DA1F2),
                                    fontWeight: FontWeight.w500, ),),
                                ),
                              ),
                            ),
                            SizedBox(width: resWidth(16, sWidth),),
                            GestureDetector(
                              onTap: (){
                                setState((){
                                  selectedDate = _with6PresetController.displayDate;
                                  w6Presets = true;
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                height : resHeight(40, sHeight),
                                width: resWidth(73, sWidth),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF1DA1F2),
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
    );
  }
  bool yesterday = false;
  bool today = false;
  bool tomorrow = false;
  bool thisSat = false;
  bool thisSun = false;
  bool nextTue = false;
}
