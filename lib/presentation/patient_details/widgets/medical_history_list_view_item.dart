import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/model/medical_history/medical_history_model_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalHistoryListViewItem extends StatelessWidget {
  final MedicalHistoryModelData medicalHistoryModel;
  const MedicalHistoryListViewItem({
    super.key,
    required this.medicalHistoryModel,
  });

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
          ListTile(
            title: CustomText(
              text: AppText.diagnosis,
              textAlign: TextAlign.start,
              style: AppStyle.textStyle14BoldKufram,
              maxLines: 100,
              color: AppColor.blue,
            ),
            subtitle: CustomText(
              text: "${medicalHistoryModel.diagnosis}",
              style: AppStyle.textStyle16RegularKufram,
              textAlign: TextAlign.start,
              maxLines: 100,
              color: AppColor.blue,
            ),
          ),
          ListTile(
            title: CustomText(
              text: AppText.treatment,
              textAlign: TextAlign.start,
              style: AppStyle.textStyle14BoldKufram,
              maxLines: 100,
              color: AppColor.blue,
            ),
            subtitle: CustomText(
              text: "${medicalHistoryModel.treatment}",
              style: AppStyle.textStyle16RegularKufram,
              textAlign: TextAlign.start,
              maxLines: 100,
              color: AppColor.blue,
            ),
          ),
          ListTile(
            title: CustomText(
              text: AppText.notes,
              textAlign: TextAlign.start,
              style: AppStyle.textStyle14BoldKufram,
              maxLines: 100,
              color: AppColor.blue,
            ),
            subtitle: CustomText(
              text: "${medicalHistoryModel.notes}",
              style: AppStyle.textStyle16RegularKufram,
              textAlign: TextAlign.start,
              maxLines: 100,
              color: AppColor.blue,
            ),
          ),
        ]),
      ),
    );
  }
}