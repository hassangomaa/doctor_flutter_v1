import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/model/health_record/health_record_model_data.dart';
import 'package:doctor_flutter_v1/presentation/patient_details/widgets/health_record_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthRecord extends StatelessWidget {
  final List<HealthRecordModelData> healthRecordModel;
  const HealthRecord({super.key, required this.healthRecordModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: AppText.healthRecord,
            style: AppStyle.textStyle20BoldKufram,
            color: AppColor.white),
      ),
      body: ListView.builder(
        itemCount: healthRecordModel.length,
        itemBuilder: (context, index) {
          return HealthRecordListViewItem(
              healthRecordModel: healthRecordModel[index]);
        },
      ),
    );
  }
}
