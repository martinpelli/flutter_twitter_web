import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_twitter_web/models/category.dart';

import 'package:flutter_twitter_web/providers/categories_provider.dart';

import 'package:flutter_twitter_web/services/notifications_service.dart';

import 'package:flutter_twitter_web/ui/buttons/custom_outlined_button.dart';
import 'package:flutter_twitter_web/ui/labels/custom_labels.dart';
import '../inputs/custom_inputs.dart';

class CategoryModal extends StatefulWidget {
  final Categoria? category;

  const CategoryModal({Key? key, this.category}) : super(key: key);

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String name = '';
  String? id;

  @override
  void initState() {
    super.initState();

    id = widget.category?.id;
    name = widget.category?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);

    return Container(
      padding: EdgeInsets.all(20),
      height: 500,
      width: 300,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.category?.nombre ?? 'Nueva categoría',
                  style: CustomLabels.h1.copyWith(color: Colors.white)),
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ))
            ],
          ),
          Divider(color: Colors.white.withOpacity(0.3)),
          SizedBox(height: 20),
          TextFormField(
            initialValue: widget.category?.nombre ?? '',
            onChanged: (value) => name = value,
            decoration: CustomInputs.loginInputDecoration(
                hint: 'Nombre de la ctaegoría',
                label: 'Categoría',
                icon: Icons.new_releases_outlined),
            style: TextStyle(color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {
                try {
                  if (id == null) {
                    await categoryProvider.newCategory(name);
                    NotificationsService.showSnackBar('$name creado');
                  } else {
                    await categoryProvider.updateCategory(id!, name);
                    NotificationsService.showSnackBar('$name actualizado');
                  }
                  Navigator.of(context).pop();
                } catch (e) {
                  Navigator.of(context).pop();
                  NotificationsService.showSnackBar('La categoría ya existe');
                }
              },
              text: 'Guardar',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      color: Color(0xff0f2041),
      boxShadow: [BoxShadow(color: Colors.black26)]);
}
