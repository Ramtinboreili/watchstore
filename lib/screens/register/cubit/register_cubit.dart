import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:watchstore/data/Model/user.dart';
import 'package:watchstore/data/costant.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/utils/shared_perferences_constants.dart';
import 'package:watchstore/utils/shared_perferences_manager.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final Dio _dio = Dio();

  pickTheLocation({required context}) async {
    await showSimplePickerLocation(
      context: context,
      isDismissible: true,
      title: 'انتخاب موقعیت مکانی',
      textCancelPicker: "لغو",
      textConfirmPicker: "انتخاب",
      zoomOption: const ZoomOption(initZoom: 8),
      initCurrentUserPosition: const UserTrackingOption.withoutUserPosition(),
      radius: AppDimens.medium,
    ).then(
      (value) => emit(LocationpikedState(location: value)),
    );
  }

  regiset({required User user}) async {
    emit(LoadingState());

    if (kDebugMode) {
      print(user.toMap());
    }
    try {
      String? token = SharedPerferencesManager()
          .getstring(SharedPreferencesConstants.token);
      _dio.options.headers["Authorization"] = "Bearer $token";
      await _dio.post(Endpoints.register,
       data: FormData.fromMap(user.toMap())).then((value) {
        if (kDebugMode) {
          print(value);
        }
         if (value.statusCode==201) {
           emit(OkResponsState());
         } else {
           emit(ErorrState());
         }
       },);
    } catch (e) {
      emit(ErorrState());
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
