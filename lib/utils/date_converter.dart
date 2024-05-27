import 'package:intl/intl.dart';

mixin DateConverter {
   static String formattedDateLocalFull(String date) {
    final localDate = DateTime.parse(date).toLocal();

    /// inputFormat - format getting from api or other func.
    /// e.g If 2021-05-27 9:34:12.781341 then format should be yyyy-MM-dd HH:mm
    /// If 27/05/2021 9:34:12.781341 then format should be dd/MM/yyyy HH:mm
    final inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    final inputDate = inputFormat.parse(localDate.toString());

    final outputFormat = DateFormat('HH:mm - dd/MM/yyyy');
    final outputDate = outputFormat.format(inputDate);
    return outputDate.toString();
  }
}