import 'package:doctor_flutter_v1/config/routes/app_page.dart';
import 'package:doctor_flutter_v1/controller/login_cubit/login_cubit.dart';
import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/core/utils/enums.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_banner.dart';
import 'package:doctor_flutter_v1/presentation/auth/login/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_extension/gen_extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginSuccessState) {
            showToast(
              context: context,
              text: 'login success',
              state: AppColorState.success,
            );
            CacheService.setData(
              key: AppCacheKey.id,
              value: state.loginModel.user?.id,
            );

            CacheService.setData(
              key: AppCacheKey.token,
              value: state.loginModel.token,
            );
            CacheService.setData(
              key: AppCacheKey.role,
              value: state.loginModel.user?.role,
            );
            switch (state.loginModel.user?.role) {
              case "doctor":
                context.pushNamedAndRemoveUntil(AppPage.doctorHomeLayout,
                    predicate: (_) => false);
                break;
              case "patient":
                context.pushNamedAndRemoveUntil(AppPage.patientHomeLayout,
                    predicate: (_) => false);
                break;
              case "family":
                context.pushNamedAndRemoveUntil(AppPage.familyHomeLayout,
                    predicate: (_) => false);
                break;
            }
          } else if (state is LoginErrorState) {
            showToast(
              context: context,
              text: state.message,
              state: AppColorState.error,
            );
          }
        },
        child: const SafeArea(
          child: Scaffold(
            body: LoginBody(),
          ),
        ));
  }
}
