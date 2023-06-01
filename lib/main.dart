import 'package:fic4_flutter_auth_bloc/bloc/login/login_bloc.dart';
import 'package:fic4_flutter_auth_bloc/bloc/product/create_product/create_product_bloc.dart';
import 'package:fic4_flutter_auth_bloc/bloc/product/get_all_product/get_all_product_bloc.dart';
import 'package:fic4_flutter_auth_bloc/bloc/product/update_product/update_product_bloc.dart';
import 'package:fic4_flutter_auth_bloc/bloc/profile/profile_bloc.dart';
import 'package:fic4_flutter_auth_bloc/bloc/register/register_bloc.dart';
import 'package:fic4_flutter_auth_bloc/data/datasources/auth_datasources.dart';
import 'package:fic4_flutter_auth_bloc/data/datasources/product_datasources.dart';
import 'package:fic4_flutter_auth_bloc/presentation/pages/login_page.dart';
import 'package:fic4_flutter_auth_bloc/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(AuthDatasources()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthDatasources()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(AuthDatasources()),
        ),
        BlocProvider(
          create: (context) => CreateProductBloc(ProductDatasources()),
        ),
        BlocProvider(
          create: (context) => GetAllProductBloc(ProductDatasources()),
        ),
        BlocProvider(
          create: (context) => UpdateProductBloc(ProductDatasources()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
