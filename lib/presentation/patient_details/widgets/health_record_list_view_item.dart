import 'package:doctor_flutter_v1/controller/send_appoinment_cubit/submit_health_record_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/model/health_record/health_record_model_data.dart';
import 'package:doctor_flutter_v1/presentation/submit_health_record/select_media.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/localization.dart';
import '../../show_media_screen.dart';

class HealthRecordListViewItem extends StatelessWidget {
  final HealthRecordModelData healthRecordModel;
  const HealthRecordListViewItem({super.key, required this.healthRecordModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.r),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: const BorderSide(
          color: AppColor.blue,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
                  leading: const Icon(Icons.monitor_heart),
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CustomText(
                      text: healthRecordModel.heart_rate.toString(),
                      style: AppStyle.textStyle16RegularKufram,
                      color: AppColor.blue,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  leading: const Icon(Icons.bloodtype_outlined),
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CustomText(
                      text: healthRecordModel.blood_pressure!,
                      style: AppStyle.textStyle16RegularKufram,
                      color: AppColor.blue,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  leading: const Icon(Icons.thermostat),
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CustomText(
                      text: healthRecordModel.temperature.toString(),
                      style: AppStyle.textStyle16RegularKufram,
                      color: AppColor.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              CustomText(
                text: AppText.walk_plan,
                style: AppStyle.textStyle14BoldKufram,
                textAlign: TextAlign.center,
                maxLines: 100,
                color: AppColor.blue,
              ),
              SizedBox(
                width: 10.r,
              ),
              CustomText(
                text: "${healthRecordModel.walkplan}",
                style: AppStyle.textStyle16RegularKufram,
                textAlign: TextAlign.center,
                maxLines: 100,
                color: AppColor.blue,
              ),
            ],
          ),
          SizedBox(
            height: 10.r,
          ),
          Row(
            children: [
              CustomText(
                text: AppText.notes,
                style: AppStyle.textStyle14BoldKufram,
                textAlign: TextAlign.center,
                maxLines: 100,
                color: AppColor.blue,
              ),
              SizedBox(
                width: 10.r,
              ),
              SizedBox(
                width: 150.r,
                child: CustomText(
                  text: "${healthRecordModel.notes}",
                  style: AppStyle.textStyle16RegularKufram,
                  textAlign: TextAlign.center,
                  maxLines: 100,
                  color: AppColor.blue,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.r,
          ),
          Row(
            children: [
              CustomText(
                text: AppText.bearthRate,
                style: AppStyle.textStyle14BoldKufram,
                textAlign: TextAlign.center,
                maxLines: 100,
                color: AppColor.blue,
              ),
              SizedBox(
                width: 10.r,
              ),
              CustomText(
                text: "${healthRecordModel.breath_rate}",
                style: AppStyle.textStyle16RegularKufram,
                textAlign: TextAlign.center,
                maxLines: 100,
                color: AppColor.blue,
              ),
            ],
          ),
          // SizedBox(
          //   height: 10.r,
          // ),
          // Row(
          //   children: [
          //     CustomText(
          //       text: AppText.treatmentPlan,
          //       style: AppStyle.textStyle14BoldKufram,
          //       textAlign: TextAlign.center,
          //       maxLines: 100,
          //       color: AppColor.blue,
          //     ),
          //     SizedBox(
          //       width: 10.r,
          //     ),
          //     SizedBox(
          //       width: 150.r,
          //       child: CustomText(
          //         text: "${healthRecordModel.treatment_plan}",
          //         style: AppStyle.textStyle16RegularKufram,
          //         textAlign: TextAlign.center,
          //         maxLines: 100,
          //         color: AppColor.blue,
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 10.r,
          ),
          Row(
            children: [
              CustomText(
                text: AppText.dateRecorded,
                style: AppStyle.textStyle16RegularKufram,
                textAlign: TextAlign.center,
                maxLines: 100,
                color: AppColor.blue,
              ),
              SizedBox(
                width: 10.r,
              ),
              CustomText(
                text:
                    "${DateFormat('yyyy-MM-dd').format(DateTime.parse(healthRecordModel.created_at!))}",
                style: AppStyle.textStyle16RegularKufram,
                textAlign: TextAlign.center,
                maxLines: 100,
                color: AppColor.blue,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShowMediaScreen(
                        media: healthRecordModel.media,
                      )));
            },
            child: CustomText(
              text: "Media",
              style: AppStyle.textStyle16RegularKufram,
              textAlign: TextAlign.center,
              maxLines: 100,
              color: AppColor.blue,
            ),
          ),
          SizedBox(
            height: 10.r,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SelectMedia(
                        id: healthRecordModel.id!.toInt(),
                      )));
            },
            child: CustomText(
              text: "uploadmedia",
              style: AppStyle.textStyle16RegularKufram,
              textAlign: TextAlign.center,
              maxLines: 100,
              color: AppColor.blue,
            ),
          )
        ]),
      ),
    );
  }
}
