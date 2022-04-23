import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter_web/providers/auth_provider.dart';
import 'package:flutter_twitter_web/router/router.dart';
import 'package:flutter_twitter_web/ui/buttons/link_text.dart';
import 'package:provider/provider.dart';

import '../../providers/login_form_provider.dart';
import '../buttons/custom_outlined_button.dart';
import '../inputs/custom_inputs.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(builder: (context) {
          final loginFormProvider =
              Provider.of<LoginFormProvider>(context, listen: false);
          return Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: loginFormProvider.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onFieldSubmitted: (_) =>
                              {onFormSumbit(loginFormProvider, authProvider)},
                          onChanged: (value) => loginFormProvider.email = value,
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
                          obscureText: true,
                          onFieldSubmitted: (_) =>
                              {onFormSumbit(loginFormProvider, authProvider)},
                          onChanged: (value) =>
                              loginFormProvider.password = value,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Ingrese su contraseña';
                            if (value.length < 7)
                              return 'La contraseña debe ser mayor a 6 caracteres';
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su constraseña',
                              label: 'Contraseña',
                              icon: Icons.lock_outline_rounded),
                        ),
                        SizedBox(height: 20),
                        CustomOutlinedButton(
                            onPressed: () =>
                                onFormSumbit(loginFormProvider, authProvider),
                            text: 'Ingresar'),
                        SizedBox(height: 20),
                        LinkText(
                          text: 'Nueva Cuenta',
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Flurorouter.registerRoute);
                          },
                        )
                      ],
                    )),
              ),
            ),
          );
        }));
  }

  void onFormSumbit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();
    if (isValid) {
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
    }
  }
}
