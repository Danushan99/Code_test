// ignore_for_file: file_names

class CommonResponseModel {
  final dynamic body;
  final int status;
  final bool isError;

  CommonResponseModel({
    required this.body,
    required this.status,
    required this.isError,
  });
}
