import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:watchstore/data/costant.dart';
import 'package:watchstore/utils/shared_perferences_constants.dart';
import 'package:watchstore/utils/shared_perferences_manager.dart';

part 'autentication_cubit_state.dart';

class AutenticationCubit extends Cubit<AutenticationState> {
  AutenticationCubit() : super(AutenticationInitial()) {
    emit(LogoutState());
  }
  final Dio _dio = Dio();
  sendSms(String mobile) async {
    emit(LoadingState());
    try {
      await _dio.post(Endpoints.sendSms, data: {"mobile": mobile}).then(
        (value) {
          if (kDebugMode) {
            print(value.toString());
          }
          if (value.statusCode == 201) {
            emit(SendState(mobile: mobile));
          } else if(value.statusCode==403) {
            emit(ErrorState());
          } else{
            emit(SendState(mobile: mobile));
          }
        },
      );
    } catch (e) {
      emit(ErrorState());
    }
  }

  verifyCode(String mobile, String code) async {
    emit(LoadingState());
    try {
      await _dio.post(Endpoints.checkSmsCode,
          data: {"mobile": mobile, "code": code}).then((value) {
        debugPrint(value.toString());
        if (value.statusCode == 201) {
          SharedPerferencesManager().saveString(
              SharedPreferencesConstants.token, value.data["data"]["token"]);
          if (value.data["data"]["is_registered"]) {
            emit(VerifiedIsRegState());
          } else {
            emit(VerifiedNotRegState());
          }
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }


  registration() async {}

  logOut() {}
}
