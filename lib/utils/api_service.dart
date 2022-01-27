import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resmart/constants/api_path.dart';

import 'package:dio_flutter_transformer2/dio_flutter_transformer2.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/utils/helpers/helpers.dart';

class ApiService {
  Dio? _productionDio;
  ApiService() {
    _productionDio = Dio(
      BaseOptions(
        baseUrl: kBaseUrl,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        responseType: ResponseType.json,
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
        },
      ),
    );

    //_dio.transformer = FlutterTransformer();
    _productionDio!.transformer = FlutterTransformer();

    _productionDio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) {
          print(options.uri.toString());
          print(options.data.toString());
          return handler.next(options);
        },
        onResponse: (Response response, handler) {
          print(response.headers.toString());
          print(response.data.toString());
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          print(e.type.toString());
          switch (e.type) {
            case DioErrorType.other:
              Fluttertoast.showToast(
                  msg: e.message,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: kPrimaryBodyColor,
                  textColor: Colors.white,
                  fontSize: 16.0);

              break;

            case DioErrorType.cancel:
              Fluttertoast.showToast(
                  msg: e.response!.data["response_message"],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: kPrimaryBodyColor,
                  textColor: Colors.white,
                  fontSize: 16.0);

              break;
            case DioErrorType.connectTimeout:
              Fluttertoast.showToast(
                  msg:  e.response!.data["response_message"],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: kPrimaryBodyColor,
                  textColor: Colors.white,
                  fontSize: 16.0);

              break;
            case DioErrorType.receiveTimeout:
              Fluttertoast.showToast(
                  msg: e.response!.data["response_message"],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: kPrimaryBodyColor,
                  textColor: Colors.white,
                  fontSize: 16.0);

              break;
            case DioErrorType.sendTimeout:
              Fluttertoast.showToast(
                  msg:e.response!.data["response_message"],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: kPrimaryBodyColor,
                  textColor: Colors.white,
                  fontSize: 16.0);

              break;
            case DioErrorType.response:
              Fluttertoast.showToast(
                  msg: e.response!.data["response_message"],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: kPrimaryBodyColor,
                  textColor: Colors.white,
                  fontSize: 16.0);

              break;
            default:
              return e.response!.data["response_message"];
          }
          // debugPrint(e.response.toString());
          // print(e.response!.headers.toString());
          // print(e.response!.data.toString());
          return handler.next(e); //continue
        },
      ),
    );
  }

  Future<Response> logIn({String? email, String? password}) async {
    var response = await _productionDio!
        .post(kLogin, data: {'email': email, 'password': password});
    print('Login response: $response');
    return response;
  }

  Future<Response> signUp(
      {String? firstname,
      String? lastname,
      String? email,
      String? password,
      String? phonenumber}) async {
    var response = await _productionDio!.post(kRegister, data: {
      'email': email,
      'password': password,
      'first_name': firstname,
      'last_name': lastname,
      'phone_number': phonenumber
    });
    //print('signUp response: $response');
    return response;
  }

  Future<Response> profile({required String token}) async {
    var response = await _productionDio!.get(kProfile,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    //print('profile response: $response');
    return response;
  }

  Future<Response> changePassword(
      {String? oldPassword,
      String? newPassword,
      String? confirmPassword,
      String? token}) async {
    var response = await _productionDio!.post(kChangePassword,
        data: {
          'old_password': oldPassword,
          'new_password': newPassword,
          'confirm_password': confirmPassword
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    //print('changePassword response: $response');
    return response;
  }

  Future<Response> resetPassword({String? email, String? token}) async {
    var response = await _productionDio!.post(kResetPassword,
        data: {'email': email},
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    //print('resetPassword response: $response');
    return response;
  }

  Future<Response> postJob(
      {String? jobName,
      int? jobPrice,
      String? jobCategory,
      String? jobDesc,
      String? jobStatus,
      String? token,
      String? jobLocation,
      List<String>? jobImage}) async {
    var response = await _productionDio!.post(kPostJob,
        data: {
          'job_name': jobName,
          'job_price': jobPrice,
          'job_category': jobCategory,
          'job_desc': jobDesc,
          'job_status': jobStatus,
          'job_location': jobLocation,
          'job_image': jobImage
        },
        // queryParameters:  {
        //   'job_name': jobName,
        //   'job_price': jobPrice,
        //   'job_category': jobCategory,
        //   'job_desc': jobDesc,
        //   'job_status': jobStatus,
        //   'job_location': jobLocation,
        //   'job_image': jobImage
        // },
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    //print('postJob response: $response');
    return response;
  }

  Future<Response> postEstate(
      {String? estateName,
      int? estatePrice,
      String? estateCategory,
      String? estateDesc,
      String? availableFor,
      String? token,
      String? estateLocation,
      List<String>? estateImage}) async {
    //   var uploadResponse =
    //     await uploadProfilePic(path: estateImage, token: token);
    // print(uploadResponse);
    //print(token);
    var response = await _productionDio!.post(kPostEstate,
        data: {
          'estate_name': estateName,
          'estate_price': estatePrice,
          'estate_category': estateCategory,
          'estate_desc': estateDesc,
          'available_for': availableFor,
          'estate_location': estateLocation,
          'estate_image': estateImage
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}));

    //print('postEstate response: $response');
    return response;
  }

  Future<Response> getAllEstates() async {
    var response = await _productionDio!.get(kListAllEstates);
    //print('getEstates response: $response');
    return response;
  }

  Future<Response> getAllJobs() async {
    var response = await _productionDio!.get(kListAllJobs);
    //print('getJobs response: $response');
    return response;
  }

  Future<Response> getImage({String? url}) async {
    // url is from the upload image returned respoonse
    var response = await _productionDio!.get(kFetchImageFromServer + url!);
    //print('getImage response: $response');
    return response;
  }

  Future uploadProfilePic({String? token, List<String>? path}) async {
    List<MultipartFile> files = [];
    for (var item in path!) {
      files.add(await MultipartFile.fromFile(item));
    }

    var formData = FormData.fromMap({"file": files});

    var response = await _productionDio!.post(
      kUploadFile,
      data: formData,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "content-type": "multipart/form-data"
        },
      ),
    );

    //print('uploadResponse: $response');

    return response.data;
  }

  Future<Response> editEstate(
      {String? estateName,
      String? estatePrice,
      String? estateCategory,
      String? estateDesc,
      String? availableFor,
      String? token,
      String? estateLocation,
      String? estateImage}) async {
    var response = await _productionDio!.put(kEditEstate,
        data: {
          'estate_name': estateName,
          'estate_price': estatePrice,
          'estate_category': estateCategory,
          'estate_desc': estateDesc,
          'available_for': availableFor,
          'estate_location': estateLocation,
          'estate_image': estateImage
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    print('editEstate response: $response');
    return response;
  }

  Future<Response> editJob(
      {String? jobName,
      String? jobPrice,
      String? jobCategory,
      String? jobDesc,
      String? jobStatus,
      String? token,
      String? jobLocation,
      String? jobImage}) async {
    var response = await _productionDio!.put(kEditJob,
        data: {
          'job_name': jobName,
          'job_price': jobPrice,
          'job_category': jobCategory,
          'job_desc': jobDesc,
          'job_status': jobStatus,
          'job_location': jobLocation,
          'job_image': jobImage
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    print('editJob response: $response');
    return response;
  }

  Future<Response> listJob({String? token}) async {
    // url is from the upload image returned respoonse
    var response = await _productionDio!.get(kListMyJob,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    print('listJobs response: $response');
    return response;
  }

  Future<Response> listEstate({String? token}) async {
    // url is from the upload image returned respoonse
    var response = await _productionDio!.get(kListMyEstate,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    print('listEstate response: $response');
    return response;
  }

  Future<Response> cancelSubscription() async {
    var response = await _productionDio!.post(kCancelSubscription, data: {});
    print('cancelSub response: $response');
    return response;
  }
}
