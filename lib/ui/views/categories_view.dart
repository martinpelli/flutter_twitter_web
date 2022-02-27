import 'package:flutter/material.dart';
import 'package:flutter_twitter_web/ui/modals/category_modal.dart';
import 'package:provider/provider.dart';

import 'package:flutter_twitter_web/providers/categories_provider.dart';

import '../../datatables/categories_datasource.dart';

import 'package:flutter_twitter_web/ui/buttons/custom_icon_button.dart';
import 'package:flutter_twitter_web/ui/labels/custom_labels.dart';

class CategoriesView extends StatefulWidget {
  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<CategoriesProvider>(context).categorias;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Categorías', style: CustomLabels.h1),
          SizedBox(height: 10),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Categoría')),
              DataColumn(label: Text('Creado por')),
              DataColumn(label: Text('Acciones')),
            ],
            source: CategoriesDTS(categorias, context),
            header: Text('Categorías disponibles', maxLines: 2),
            onRowsPerPageChanged: (rows) {
              setState(() {
                _rowsPerPage = rows ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                icon: Icons.add_outlined,
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (_) => CategoryModal(category: null));
                },
                text: 'Crear',
              )
            ],
          )
        ],
      ),
    );
  }
}
