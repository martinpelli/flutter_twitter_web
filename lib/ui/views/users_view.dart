import 'package:flutter/material.dart';
import 'package:flutter_twitter_web/providers/users_provider.dart';
import 'package:provider/provider.dart';

import '../../datatables/users_datasource.dart';

import 'package:flutter_twitter_web/ui/labels/custom_labels.dart';

class UsersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final usersDataSource = UsersDTS(usersProvider.users);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Users View', style: CustomLabels.h1),
          SizedBox(height: 10),
          PaginatedDataTable(
              sortAscending: usersProvider.ascending,
              sortColumnIndex: usersProvider.sortColumnIndex,
              columns: [
                DataColumn(label: Text('Avatar')),
                DataColumn(
                    label: Text('Nombre'),
                    onSort: (colIndex, _) {
                      usersProvider.sortColumnIndex = colIndex;
                      usersProvider.sort<String>((user) => user.nombre);
                    }),
                DataColumn(
                    label: Text('Email'),
                    onSort: (colIndex, _) {
                      usersProvider.sortColumnIndex = colIndex;
                      usersProvider.sort<String>((user) => user.correo);
                    }),
                DataColumn(label: Text('UID')),
                DataColumn(label: Text('Acciones')),
              ],
              source: usersDataSource,
              onPageChanged: (page) {})
        ],
      ),
    );
  }
}
