import 'dart:convert';

class SingleAPIResponseModel<T> {
  // variables

  final String? result;

  final T? data;

  SingleAPIResponseModel({
    this.result,
    this.data,
  });

  // ignore: missing_return
  SingleAPIResponseModel convertToGenaricModelType(String jsonString) {
    final jsonObj = json.decode(jsonString);

    switch (T) {
      default:
        return SingleAPIResponseModel(
          result: "",
          data: "",
        );
    }
  }
}
