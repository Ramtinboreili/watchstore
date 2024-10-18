part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class LoadingState extends RegisterState {}
final class ErorrState extends RegisterState {}
final class OkResponsState extends RegisterState {}
final class LocationpikedState extends RegisterState {
LocationpikedState({required this.location}); 
  final GeoPoint? location ;

}

