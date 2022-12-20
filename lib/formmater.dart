import 'package:intl/intl.dart';

String shortDate(String date){
  return DateFormat("dd MMM, yyyy").format(DateTime.tryParse(date)!);
}