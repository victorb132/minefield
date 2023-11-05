import 'package:flutter/material.dart';
import 'package:minefield/components/field_widget.dart';
import 'package:minefield/models/field.dart';
import 'package:minefield/models/table_mine.dart';

class TableMineWidget extends StatelessWidget {
  final TableMine tableMine;
  final void Function(Field) onOpen;
  final void Function(Field) onChangeMarked;

  const TableMineWidget({
    super.key,
    required this.tableMine,
    required this.onOpen,
    required this.onChangeMarked,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.count(
        crossAxisCount: tableMine.columns,
        children: tableMine.fields.map((f) {
          return FieldWidget(
            field: f,
            onOpen: onOpen,
            onChangeMarked: onChangeMarked,
          );
        }).toList(),
      ),
    );
  }
}
