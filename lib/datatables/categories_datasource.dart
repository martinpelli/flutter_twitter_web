import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_twitter_web/models/category.dart';

import '../providers/categories_provider.dart';

import '../ui/modals/category_modal.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);

  @override
  DataRow getRow(int index) {
    final category = this.categorias[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(category.id)),
      DataCell(Text(category.nombre)),
      DataCell(Text(category.usuario.nombre)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => CategoryModal(category: category));
              },
              icon: Icon(Icons.edit_outlined)),
          IconButton(
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text('¿Está seguro que desea borrarlo?'),
                  content: Text('¿Borrar definitivamente ${category.nombre}?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No')),
                    TextButton(
                        onPressed: () async {
                          await Provider.of<CategoriesProvider>(context,
                                  listen: false)
                              .deleteCategory(category.id);
                          Navigator.of(context).pop();
                        },
                        child: Text('Si, borrar')),
                  ],
                );
                showDialog(context: context, builder: (_) => dialog);
              },
              icon: Icon(Icons.delete_outline,
                  color: Colors.red.withOpacity(0.8)))
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;
}
