import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/providers.dart';

import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter_twitter_web/services/navigation_services.dart';
import 'package:flutter_twitter_web/services/notifications_service.dart';

import '../../models/user.dart';

import '../cards/white_card.dart';
import 'package:flutter_twitter_web/ui/labels/custom_labels.dart';
import 'package:flutter_twitter_web/ui/inputs/custom_inputs.dart';

class UserView extends StatefulWidget {
  final String uid;

  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);
    usersProvider.getUserById(widget.uid).then((userDB) {
      if (userDB != null) {
        userFormProvider.user = userDB;
        userFormProvider.formKey = GlobalKey<FormState>();
        setState(() {
          user = userDB;
        });
      } else {
        NavigationService.replaceTo('/dashboard/users');
      }
    });
  }

  @override
  void dispose() {
    user = null;
    Provider.of<UserFormProvider>(context, listen: false).user = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('UserView', style: CustomLabels.h1),
          SizedBox(height: 10),
          if (user == null)
            WhiteCard(
                child: Container(
              height: 300,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )),
          _UserViewBody()
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: {0: FixedColumnWidth(250)},
        children: [
          TableRow(children: [_AvatarContainer(), _UserViewForm()])
        ],
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
      title: 'Información general',
      child: Form(
        key: userFormProvider.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(children: [
          TextFormField(
            onChanged: (name) => userFormProvider.copyUserWith(nombre: name),
            initialValue: user.nombre,
            decoration: CustomInputs.formInputDecoration(
                hint: 'Nombre del usuario',
                label: 'Nombre',
                icon: Icons.supervised_user_circle_outlined),
            validator: (name) {
              if (name == null || name.isEmpty) return 'Ingrese un nombre';
              if (name.length < 2)
                return 'El nombre debe ser mayor a dos caracteres';
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            initialValue: user.correo,
            decoration: CustomInputs.formInputDecoration(
                hint: 'Correo del usuario',
                label: 'Correo',
                icon: Icons.mark_email_read_outlined),
            validator: (mail) {
              if (!EmailValidator.validate(mail ?? ''))
                return 'Email no válido';
              return null;
            },
          ),
          SizedBox(height: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 110),
            child: ElevatedButton(
              onPressed: () async {
                final saved = await userFormProvider.updateUser();
                if (saved) {
                  NotificationsService.showSnackBar('Usuario Actualizado');
                  Provider.of<UsersProvider>(context, listen: false)
                      .refreshUser(user);
                } else {
                  NotificationsService.showSnackBarError('Se produjo un error');
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  shadowColor: MaterialStateProperty.all(Colors.transparent)),
              child: Row(children: [
                Icon(Icons.save_outlined, size: 20),
                Text(' Guardar')
              ]),
            ),
          )
        ]),
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final usersProvider = Provider.of<UsersProvider>(context);
    final user = userFormProvider.user!;
    final image = (user.img == null)
        ? Image(image: AssetImage('no-image.jpg'))
        : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!);

    return WhiteCard(
        width: 250,
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Text('Profile', style: CustomLabels.h2),
              SizedBox(height: 20),
              Container(
                width: 150,
                height: 160,
                child: Stack(
                  children: [
                    ClipOval(child: image),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white, width: 5)),
                        child: FloatingActionButton(
                          backgroundColor: Colors.indigo,
                          elevation: 0,
                          child: Icon(Icons.camera_alt_outlined, size: 20),
                          onPressed: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg', 'jpeg', 'png'],
                                    allowMultiple: false);

                            if (result != null) {
                              PlatformFile file = result.files.first;
                              NotificationsService.showBusyIndicator(context);
                              final updatedUser =
                                  await userFormProvider.uploadImage(
                                      '/uploads/usuarios/${user.uid}',
                                      file.bytes!);
                              usersProvider.refreshUser(updatedUser);
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                user.nombre,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
