import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_banner.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/enums.dart';
import '../../model/appoinment_model.dart';
import '../../model/send_appointment_response_model.dart';
import '../../model/submit_health_record_response_model/submit_health_record_response_model.dart';
import '../../repo/submit_health_record_repo.dart';

part 'submit_health_record_state.dart';

class SubmitHealthRecordCubit extends Cubit<SubmitHealthRecordState> {
  SubmitHealthRecordCubit() : super(SubmitHealthRecordInitial());
  static SubmitHealthRecordCubit get(BuildContext context) =>
      BlocProvider.of<SubmitHealthRecordCubit>(context);
  final TextEditingController bloodPressureController = TextEditingController();
  final TextEditingController breathRate = TextEditingController();

  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController heartRateController = TextEditingController();
  // final TextEditingController treatmentPlanController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController workPlan = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final SubmitHealthRecordRepo _repo = SubmitHealthRecordRepoImp();
  submitHealthRecord(double lat, double long) async {
    emit(SubmitHealthRecordLoadingState());
    final result = await _repo.submitHealthRecord(
      bloodPressure: bloodPressureController.text,
      temperature: double.tryParse(temperatureController.text) ?? 0.0,
      heartRate: double.tryParse(heartRateController.text) ?? 0.0,
      // treatmentPlan: treatmentPlanController.text,
      breathRate: breathRate.text,
      note: notesController.text,
      lat: lat < 0 ? lat * -1 : lat,
      long: long < 0 ? long * -1 : long,
      walkPlan: workPlan.text,
    );

    result.fold((l) {
      showToast(state: AppColorState.error, text: l.errorMessage);
      emit(SubmitHealthRecordErrorState(errorMessage: l.errorMessage));
    }, (r) {
      showToast(state: AppColorState.success, text: r.message);
      log(r.message.toString());
      emit(SubmitHealthRecordSuccessState(submitHealthRecordResponseModel: r));
    });
  }

  Future<void> uploadFile(int id) async {
    emit(UploadFileLoading());
    final result = await _repo.uploadFile(file, id);
    result.fold((l) {
      showToast(state: AppColorState.error, text: l.errorMessage);
      emit(UploadFileError(errorMessage: l.errorMessage));
    }, (r) {
      showToast(state: AppColorState.success, text: r);
      emit(UploadFileSuccess(message: r));
    });
  }

  bool validateForm(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }

  void clearControllers() {
    bloodPressureController.clear();
    temperatureController.clear();
    heartRateController.clear();
    // treatmentPlanController.clear();
  }

  List<File> file = [];

  Future<void> addFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      if (file.isEmpty) {
        file = result.paths.map((path) => File(path!)).toList();
      } else {
        file.addAll(result.paths.map((path) => File(path!)).toList());
      }
      emit(PickFile(file: file));
    } else {}
  }
}
