import 'dart:math';

import 'field.dart';

class TableMine {
  final int lines;
  final int columns;
  final int qntBombs;

  final List<Field> _fields = [];

  TableMine({
    required this.lines,
    required this.columns,
    required this.qntBombs,
  }) {
    _createFields();
    _relationNeighbors();
    _sortMines();
  }

  void restart() {
    for (var f in _fields) {
      f.restart();
    }
    _sortMines();
  }

  void revealBombs() {
    for (var f in _fields) {
      f.revealBomb();
    }
  }

  void _createFields() {
    for (int l = 0; l < lines; l++) {
      for (int c = 0; c < columns; c++) {
        _fields.add(Field(line: l, column: c));
      }
    }
  }

  void _relationNeighbors() {
    for (var field in _fields) {
      for (var neighbor in _fields) {
        field.addNeighbor(neighbor);
      }
    }
  }

  void _sortMines() {
    int sorteds = 0;

    if (qntBombs > lines * columns) {
      return;
    }

    while (sorteds < qntBombs) {
      int i = Random().nextInt(_fields.length);

      if (!_fields[i].mined) {
        sorteds++;
        _fields[i].mine();
      }
    }
  }

  List<Field> get fields {
    return _fields;
  }

  bool get resolved {
    return _fields.every((f) => f.resolved);
  }
}
