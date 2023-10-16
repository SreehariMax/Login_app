// ignore_for_file: dead_code

import 'package:contacts_app/src/controller/auth_cubit/cubit/auth_cubit.dart';
import 'package:contacts_app/src/core/common_widget/app_button.dart';
import 'package:contacts_app/src/core/constants/strings.dart';
import 'package:contacts_app/src/core/helpers/validation_helper.dart';
import 'package:contacts_app/src/views/pages/widgets/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey();

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AuthCubit());
    return Scaffold(
      body: SafeArea(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: emailController,
                      decoration:
                          const InputDecoration(label: Text(Strings.email)),
                      validator: ValidationHelpers.validateEmail),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration:
                        const InputDecoration(label: Text(Strings.password)),
                    validator: ValidationHelpers.isValidPassword,
                  ),

                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      // TODO: implement listener

                      if (state is AuthStateAuthenticated) {
                            return;
                          }

                          if (state is AuthStateUnAuthenticated) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("Authentication Error"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("OK"))
                                      ],
                                    ));
                          }
                    },
                    child: BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state is AuthStateLoading) {
                          return const CircularProgressIndicator();
                        }
                        return AppButton(
                          buttonTitle: Strings.login,
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              String email = emailController.text;
                              String password = passwordController.text;
                            }
                          },
                        );
                      },
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // TextFormField(
                  //   decoration: InputDecoration(label: Text('Email')),
                  // )

                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: Strings.newuser,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.black),
                        ),
                        TextSpan(
                            text: Strings.signuptext,
                            style: TextStyle(color: Colors.green))
                      ]),
                    ),
                  )
                ],
              ))),
    );
  }
}
