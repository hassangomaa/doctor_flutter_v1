import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_flutter_v1/model/login_model.dart';
import 'package:doctor_flutter_v1/repo/login.dart';

import '../../core/services/cache/app_cache_key.dart';
import '../../core/services/cache/cache_service.dart';
import '../../core/utils/enums.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repo) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  final LoginRepo _repo;
  bool isPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isRememberMe = false;

  void changeRememberMe() {
    isRememberMe = !isRememberMe;
    emit(ChangeRememberMeState());
  }

  void changePasswordState() {
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      final response =
          await _repo.loginUser(emailController.text, passwordController.text);
      response.fold((error) {
        emit(LoginErrorState(error.errorMessage));
      }, (data) {
        selectdRole = data.user.role;
        CacheService.setData(
          key: AppCacheKey.role,
          value: data.user.role,
        );
        emit(LoginSuccessState(data));
      });
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();

    return super.close();
  }
}
