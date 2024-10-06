part of 'autentication_cubit_cubit.dart';


@immutable
sealed class AutenticationState {}

final class AutenticationInitial extends AutenticationState {}
final class LoadingState extends AutenticationState {}
final class ErrorState  extends AutenticationState {}
final class SendState  extends AutenticationState {
  final mobile ;
  SendState({required this.mobile});
}
final class VerifiedIsRegState  extends AutenticationState {}
final class VerifiedNotRegState  extends AutenticationState {}
final class LogginState  extends AutenticationState {}
final class LogoutState  extends AutenticationState {}

