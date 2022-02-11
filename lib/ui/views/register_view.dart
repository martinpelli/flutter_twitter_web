import 'package:flutter/material.dart';
import 'package:flutter_twitter_web/router/router.dart';
import 'package:flutter_twitter_web/ui/buttons/link_text.dart';

import '../buttons/custom_outlined_button.dart';
import '../inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 370),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese su nombre',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle),
              ),
              SizedBox(height: 20),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese su correo',
                    label: 'Email',
                    icon: Icons.email),
              ),
              SizedBox(height: 20),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese su constraseña',
                    label: 'Contraseña',
                    icon: Icons.lock_outline_rounded),
              ),
              SizedBox(height: 20),
              CustomOutlinedButton(onPressed: () {}, text: 'Crear cuenta'),
              SizedBox(height: 20),
              LinkText(
                text: 'Ir al login',
                onPressed: () {
                  Navigator.pushNamed(context, Flurorouter.loginRoute);
                },
              )
            ],
          )),
        ),
      ),
    );
  }
}
