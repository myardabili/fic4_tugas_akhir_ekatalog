// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:fic4_flutter_auth_bloc/data/datasources/auth_datasources.dart';
import 'package:fic4_flutter_auth_bloc/data/models/request/login_model.dart';
import 'package:fic4_flutter_auth_bloc/data/models/response/login_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthDatasources authDatasources;
  LoginBloc(
    this.authDatasources,
  ) : super(LoginInitial()) {
    on<DoLoginEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final result = await authDatasources.login(event.loginModel);
        emit(LoginLoaded(loginResponseModel: result));
      } catch (e) {
        emit(LoginError(message: 'Network Problem!'));
      }
    });
  }
}
