import 'package:flutter/material.dart';

import '../../utils/color_peanut.dart';
import '../../utils/demensions.dart';

class DoctorInfoWidget extends StatelessWidget {
  final String doctorName;
  final String date;
  final String time;
  final String hospitalName;
  final String phoneNumber;
  final String email;

  const DoctorInfoWidget({
    Key? key,
    required this.doctorName,
    required this.date,
    required this.time,
    required this.hospitalName,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctorName,
              style: TextStyle(
                fontSize: PDimensions.FONT_SIZE_SPAN,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: ColorPeanut.ICON_DASH_BOARD,
                ),
                SizedBox(width: 5),
                Text(date),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: ColorPeanut.ICON_DASH_BOARD,
                ),
                SizedBox(width: 5),
                Text(time),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.local_hospital,
                  color: ColorPeanut.ICON_DASH_BOARD,
                ),
                SizedBox(width: 5),
                Text(hospitalName),
              ],
            ),
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: const Divider(
                color: Color(0xff9B9B9B),
                height: 10,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Số điện thoại:'),
                Text(phoneNumber),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email:'),
                Text(email),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
