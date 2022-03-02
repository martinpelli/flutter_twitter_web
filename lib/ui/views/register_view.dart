import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_twitter_web/providers/auth_provider.dart';
import 'package:flutter_twitter_web/providers/regiter_form_provider.dart';

import 'package:email_validator/email_validator.dart';

import 'package:flutter_twitter_web/router/router.dart';

import '../buttons/custom_outlined_button.dart';
import '../inputs/custom_inputs.dart';
import 'package:flutter_twitter_web/ui/buttons/link_text.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RegisterFormProvider(),
        child: Builder(builder: (context) {
          final registerFormProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);
          child:
          return Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: registerFormProvider.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: ((value) =>
                              registerFormProvider.name = value),
                          validator: ((value) {
                            if (value == null || value.isEmpty)
                              return 'Ingrese su nombre';
                            if (value.length < 5)
                              return 'El nombre debe ser mayor a cuatro caracteres';
                          }),
                          style: TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su nombre',
                              label: 'Nombre',
                              icon: Icons.supervised_user_circle),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: ((value) =>
                              registerFormProvider.email = value),
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? ''))
                              return 'Email no válido';
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su correo',
                              label: 'Email',
                              icon: Icons.email),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: ((value) =>
                              registerFormProvider.password = value),
                          validator: ((value) {
                            if (value == null || value.isEmpty)
                              return 'Ingrese su constraseña';
                            if (value.length < 7)
                              return 'La contraseña debe ser mayor a 6 caracteres';
                          }),
                          style: TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su constraseña',
                              label: 'Contraseña',
                              icon: Icons.lock_outline_rounded),
                        ),
                        SizedBox(height: 20),
                        CustomOutlinedButton(
                            onPressed: () {
                              final validForm =
                                  registerFormProvider.validateForm();
                              if (!validForm) return;
                              final authProvider = Provider.of<AuthProvider>(
                                  context,
                                  listen: false);
                              authProvider.register(
                                  registerFormProvider.email,
                                  registerFormProvider.password,
                                  registerFormProvider.name);
                            },
                            text: 'Crear cuenta'),
                        SizedBox(height: 20),
                        LinkText(
                          text: 'Ir al login',
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Flurorouter.loginRoute);
                          },
                        )
                      ],
                    )),
              ),
            ),
          );
        }));
  }
}
