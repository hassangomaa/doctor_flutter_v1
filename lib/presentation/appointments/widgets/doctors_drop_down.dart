import 'package:doctor_flutter_v1/controller/appointment_cubit/appointment_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_style.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../model/doctors_response_model/datum.dart';

class DoctorNamesDropDown extends StatefulWidget {
  const DoctorNamesDropDown({
    super.key,
  });

  @override
  State<DoctorNamesDropDown> createState() => _DoctorNamesDropDownState();
}

class _DoctorNamesDropDownState extends State<DoctorNamesDropDown> {
  List<Doctor> doctorList = [];
  Doctor? selectedDoctor;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentCubit, AppointmentState>(
      listener: (context, state) {
        if (state is GetDoctorsSuccessState) {
          doctorList = state.doctorsResponseModel.doctors ?? [];
          selectedDoctor = doctorList[0];
        }
      },
      builder: (context, state) {
        if (state is GetDoctorsSuccessState) {
          // Doctor selectedDoctor;
          // List<Doctor> doctorList = state.doctorsResponseModel.doctors ?? [];
          // Doctor? selectedDoctor = doctorList[0];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "SelectContact",
                color: AppColor.blue,
                style: AppStyle.textStyle14RegularKufram,
              ),
              DropdownButton<Doctor>(
                borderRadius: BorderRadius.circular(10),
                style: AppStyle.textStyle14RegularKufram,
                alignment: AlignmentDirectional.centerStart,
                hint: CustomText(
                  text: "Select Doctor",
                  style: AppStyle.textStyle14RegularKufram,
                ),
                value: selectedDoctor,
                items: doctorList.map(
                  (Doctor doctor) {
                    return DropdownMenuItem<Doctor>(
                      value: doctor,
                      child: CustomText(
                        text: doctor.name ?? '',
                        style: AppStyle.textStyle12RegularAlmarai,
                      ),
                    );
                  },
                ).toList(),
                onChanged: (Doctor? newDoctor) {
                  setState(() {
                    selectedDoctor = newDoctor;
                  });
                  AppointmentCubit.get(context).doctorId =
                      selectedDoctor?.id.toString() ??
                          doctorList[0].id.toString();
                  // When a doctor is selected, print their ID or send it to the backend
                  print('Selected Doctor ID: ${selectedDoctor?.id}');
                },
                isExpanded: true,
              ),
            ],
          );
        } else if (state is GetDoctorsErrorState) {
          return const Text('Error');
        } else {
          return const Text('Loading ... ');
        }
      },
    );
  }
}
