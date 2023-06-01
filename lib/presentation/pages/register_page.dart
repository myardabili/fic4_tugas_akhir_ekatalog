import 'package:fic4_flutter_auth_bloc/bloc/register/register_bloc.dart';
import 'package:fic4_flutter_auth_bloc/data/models/request/register_model.dart';
import 'package:fic4_flutter_auth_bloc/presentation/pages/login_page.dart';
import 'package:fic4_flutter_auth_bloc/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController!.dispose();
    emailController!.dispose();
    passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Register Page",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RTextField(
              label: 'Nama',
              prefixIcon: Icon(
                Icons.person,
                color: Colors.blue[300],
              ),
              controller: nameController,
            ),
            const SizedBox(
              height: 14.0,
            ),
            RTextField(
              label: 'Email',
              prefixIcon: Icon(
                Icons.email,
                color: Colors.blue[300],
              ),
              controller: emailController,
            ),
            const SizedBox(
              height: 14.0,
            ),
            RTextField(
              label: 'Password',
              prefixIcon: Icon(
                Icons.password,
                color: Colors.blue[300],
              ),
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(
              height: 24.0,
            ),
            // MainButton(
            //   label: 'Register',
            //   onPressed: () {
            //     final requestModel = RegisterModel(
            //       name: nameController!.text,
            //       email: emailController!.text,
            //       password: passwordController!.text,
            //     );
            //     context.read<RegisterBloc>().add(
            //           SaveRegisterEvent(request: requestModel),
            //         );
            //   },
            // ),
            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterLoaded) {
                  nameController!.clear();
                  emailController!.clear();
                  passwordController!.clear();
                  //navigasi
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: Colors.blue,
                        content: Text(
                            'success register with id: ${state.model.id}')),
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }));
                }
              },
              builder: (context, state) {
                if (state is RegisterLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.blue[300],
                    ),
                    onPressed: () {
                      final requestModel = RegisterModel(
                        name: nameController!.text,
                        email: emailController!.text,
                        password: passwordController!.text,
                      );
                      context.read<RegisterBloc>().add(
                            SaveRegisterEvent(request: requestModel),
                          );
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sudah punya akun?",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
