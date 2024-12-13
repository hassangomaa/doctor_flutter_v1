part of 'submit_health_record_cubit.dart';

sealed class SubmitHealthRecordState {
  const SubmitHealthRecordState();
}

final class SubmitHealthRecordInitial extends SubmitHealthRecordState {}

final class SubmitHealthRecordSuccessState extends SubmitHealthRecordState {
  final SubmitHealthRecordResponseModel submitHealthRecordResponseModel;
  const SubmitHealthRecordSuccessState(
      {required this.submitHealthRecordResponseModel});
}

final class SubmitHealthRecordErrorState extends SubmitHealthRecordState {
  final String errorMessage;
  const SubmitHealthRecordErrorState({required this.errorMessage});
}

final class SubmitHealthRecordLoadingState extends SubmitHealthRecordState {}

final class PickFile extends SubmitHealthRecordState {
  final List<File> file;
  const PickFile({required this.file});
}

final class UploadFileLoading extends SubmitHealthRecordState {}

final class UploadFileSuccess extends SubmitHealthRecordState {
  final String message;
  const UploadFileSuccess({required this.message});
}

final class UploadFileError extends SubmitHealthRecordState {
  final String errorMessage;
  const UploadFileError({required this.errorMessage});
}
