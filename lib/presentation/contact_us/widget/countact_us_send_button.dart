import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/controller/countact_us/countact_us_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/enums.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_banner.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_elevated_button.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountactUsSendButton extends StatelessWidget {
  const CountactUsSendButton({
    super.key,
    required this.doctorId,
  });
  final String doctorId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountactUsCubit, CountactUsState>(
      listener: (context, state) {
        if (state is CountactUsSuccessState) {
          showToast(
            context: context,
            text: state.contactUsMessage,
            state: AppColorState.success,
          );
        } else if (state is CountactUsErrorState) {
          showToast(
            context: context,
            text: state.error,
            state: AppColorState.error,
          );
        }
      },
      builder: (context, state) {
        if (state is CountactUsLoadingState) {
          return const CustomLoading(
            size: 100,
          );
        } else {
          return CustomElevatedButton(
            title: AppText.send,
            onPressed: () {
              if (!CountactUsCubit.get(context).formKey.currentState!.validate()) {
                return;
              }
              CountactUsCubit.get(context).sendMessage(
                doctorId,
              );
            },
          );
        }
      },
    );
  }
}
