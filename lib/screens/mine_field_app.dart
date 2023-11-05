import 'package:flutter/material.dart';
import 'package:minefield/components/result_widget.dart';
import 'package:minefield/components/table_mine_widget.dart';
import 'package:minefield/models/explosion_exception.dart';
import 'package:minefield/models/field.dart';
import 'package:minefield/models/table_mine.dart';

class MineFieldApp extends StatefulWidget {
  const MineFieldApp({super.key});

  @override
  State<MineFieldApp> createState() => _MineFieldAppState();
}

class _MineFieldAppState extends State<MineFieldApp> {
  bool? _won;
  TableMine? _tableMine = TableMine(
    lines: 12,
    columns: 12,
    qntBombs: 3,
  );

  void _restart() {
    setState(() {
      _won = null;
      _tableMine!.restart();
    });
  }

  void _open(Field field) {
    if (_won != null) {
      return;
    }

    setState(() {
      try {
        field.open();
        if (_tableMine!.resolved) {
          _won = true;
        }
      } on ExplosionException {
        _won = false;
        _tableMine!.revealBombs();
      }
    });
  }

  void _changeMarked(Field field) {
    if (_won != null) {
      return;
    }

    setState(() {
      field.changeMarked();
      if (_tableMine!.resolved) {
        _won = true;
      }
    });
  }

  TableMine _getTable(double width, double height) {
    if (_tableMine == null) {
      int qntColumns = 15;
      double fieldSize = width / qntColumns;
      int qntLines = (height / fieldSize).floor();

      _tableMine = TableMine(
        lines: qntLines,
        columns: qntColumns,
        qntBombs: 12,
      );
    }
    return _tableMine!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: ResultWidget(
          won: _won,
          onRestart: _restart,
        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return TableMineWidget(
                tableMine: _getTable(
                  constraints.maxWidth,
                  constraints.maxHeight,
                ),
                onOpen: _open,
                onChangeMarked: _changeMarked,
              );
            },
          ),
        ),
      ),
    );
  }
}
