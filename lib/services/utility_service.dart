import 'package:anglican_lagos/common/app_consts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class UtilityService {
 static String getSqlFormatDate(DateTime dateString) {
   return   DateFormat('yyyy-MM-dd HH:mm:ss').format(dateString);
 }
 static String getFormattedDateString(String dateString) {
   try{
 var dateTime  = DateTime.parse(dateString);
   return   DateFormat('d MMMM, y').format(dateTime);
   }catch(e){
     print(e.toString());
   }
  return '';
 }
 static String getCurrentDate() {
   return   DateFormat.yMMMMd("en_US").format(DateTime.now()) + ' at ' + DateFormat('HH:mm:ss a').format(DateTime.now()); //   -> July 10, 1996;
 }
 static String getFormattedNumber(dynamic numberToFormat) {
   final formatter = new NumberFormat("#,###.##");
   return formatter.format(numberToFormat);
 }
 static String getFormattedNaira(dynamic numberToFormat) {
   final formatter = new NumberFormat("#,###.##");
   var str = formatter.format(numberToFormat);
   return AppConsts.NAIRA_SYMBOL + str;
 }
 static String convertToNearestNumber(int item) {
   if(item == null) throw 'Number cannot be null';
   if (item < 1000){
   return item.toString();
   }
   if (item >= 1000 && item < 1000000){
   var number = item / 1000;
   return (((number * 10).round() / 10)).toString() + 'K';
   }
   if (item >= 1000000 && item < 1000000000){
   var number1 = item / 1000000;
   return (((number1 * 10).round() / 10)).toString() + 'M';
   }
   if (item >= 1000000000){
   var number2 = item / 1000000000;
   return (((number2 * 10).round() / 10)).toString() + 'B';
   }
   return '';
 }
 static Map<String, String> getFormattedPlayingTime(int totalDurationInSeconds, int positionInSeconds) {
   var durationHours =  (totalDurationInSeconds / 3600).floor();
   var durationMinutes = ((totalDurationInSeconds / 60) % 60).floor();
   var durationSeconds = totalDurationInSeconds % 60;
   var duration = '';
   duration += durationHours > 0 ? durationHours.toString().length == 1 ? '0${durationHours.toString()}:' : '${durationHours.toString()}:' : '';
   duration += durationMinutes > 0 ? durationMinutes.toString().length == 1 ? '0${durationMinutes.toString()}:' : '${durationMinutes.toString()}:' : '00:';
   duration += durationSeconds > 0 ? durationSeconds.toString().length == 1 ? '0${durationSeconds.toString()}' : '${durationSeconds.toString()}' : '00';

   ///Position
   var positionHours =  (positionInSeconds / 3600).floor();
   var positionMinutes = ((positionInSeconds / 60) % 60).floor();
   var positionSeconds = positionInSeconds % 60;
   var position = '';
   position += positionHours > 0 ? positionHours.toString().length == 1 ? '0${positionHours.toString()}:' : '${positionHours.toString()}:' : '';
   position += positionMinutes > 0 ? positionMinutes.toString().length == 1 ? '0${positionMinutes.toString()}:' : '${positionMinutes.toString()}:' : '00:';
   position += positionSeconds > 0 ? positionSeconds.toString().length == 1 ? '0${positionSeconds.toString()}' : '${positionSeconds.toString()}' : '00';
   Map<String, String> items ={};
   if(positionInSeconds > totalDurationInSeconds){
     items.addAll({'duration':duration,'position':duration});
   }else{
     items.addAll({'duration':duration,'position':position});
   }
   return items;
 }
 static String padLeft(BigInt number, {String padWith = '0', int padSize = 6}) {
   return number.toString().padLeft(padSize, padWith);
 }
 static void launchURL(String url) async {
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     print('Could not launch $url');
   }
 }

 static bool validateNigerianPhoneNumber(String value) {
   if(value == null)
     return false;
   if(value.substring(0, 1) != '+')
     return false;
   return true;
 }

}