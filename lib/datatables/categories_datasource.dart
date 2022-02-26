import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text('Cell #1')),
      DataCell(Text('Cell #2')),
      DataCell(Text('Cell #3')),
      DataCell(Text('Cell #4')),
    ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 1000;

  @override
  int get selectedRowCount => 0;
}
