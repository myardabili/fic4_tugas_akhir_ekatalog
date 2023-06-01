// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fic4_flutter_auth_bloc/data/datasources/auth_datasources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fic4_flutter_auth_bloc/data/models/request/register_model.dart';
import 'package:fic4_flutter_auth_bloc/data/models/response/register_response_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthDatasources datasources;
  RegisterBloc(
    this.datasources,
  ) : super(RegisterInitial()) {
    on<SaveRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      final result = await datasources.register(event.request);
      print(result);
      emit(RegisterLoaded(model: result));
    });
  }
}
