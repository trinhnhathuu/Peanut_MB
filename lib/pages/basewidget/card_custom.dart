import 'package:flutter/material.dart';
import 'package:peanut_app/utils/color_peanut.dart';
import 'package:peanut_app/utils/device_utils.dart';

class CardCustom extends StatelessWidget {
  final String imagePath;
  final String title;
  final String doctorName;
  final String hospital;
  final String appointmentTime;
  final VoidCallback onContactDoctor;
  final VoidCallback onSeeDetails;

  const CardCustom({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.doctorName,
    required this.hospital,
    required this.appointmentTime,
    required this.onContactDoctor,
    required this.onSeeDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: [
            Container(
              width: DeviceUtils.getScaledWidth(context, 0.2),
              height: DeviceUtils.getScaledHeight(context, 0.1),
              child: CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 10.0,
              )
            ),
            Container(
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.vertical,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text('Bác sĩ: $doctorName'),
                  Text(hospital),
                  Text('Thời gian: $appointmentTime'),
                ],
              ),
            ),
            Container(

              child: Flex(
                direction: Axis.vertical,
                children: [
                  GestureDetector(
                    onTap: onContactDoctor,
                    child: Container(
                      alignment: Alignment.center,
                      width: DeviceUtils.getScaledWidth(context, 0.25),
                      height: DeviceUtils.getScaledHeight(context, 0.03),
                      decoration: BoxDecoration(
                        color: ColorPeanut.BUTTON_DONGY,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Text(
                        'Liên hệ bác sĩ',
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: onSeeDetails,
                    child: Container(
                      alignment: Alignment.center,
                      height: DeviceUtils.getScaledHeight(context, 0.03),
                      width: DeviceUtils.getScaledWidth(context, 0.25),
                      decoration: BoxDecoration(
                        color: ColorPeanut.BUTTON_DONGY,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Text(
                        'Chi tiết',
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      ),
                    ),
                  ),

                        ],
                      ),
            ),

    ])));
  }
}
